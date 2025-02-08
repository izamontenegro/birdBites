//
//  CameraView.swift
//  birdBites
//
//  Created by Melissa Freire Guedes on 28/01/25.
//

import SwiftUI
import AVFoundation
import CoreML
import Vision
import UIKit
//import BirdBoxModel
class CameraController: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var image: UIImage? = nil
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    override init() {
        super.init()
        setupCamera()
    }
    
    private func setupCamera() {
        captureSession = AVCaptureSession()
        
        // Configura o dispositivo de captura da câmera
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoDeviceInput: AVCaptureDeviceInput
        do {
            videoDeviceInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        // Adiciona o dispositivo de entrada à sessão
        if captureSession?.canAddInput(videoDeviceInput) == true {
            captureSession?.addInput(videoDeviceInput)
        } else {
            return
        }
        
        // Criação do layer de preview para a câmera
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        previewLayer?.videoGravity = .resizeAspectFill
    }
    
    // Função para começar a capturar imagens (vídeo contínuo)
    func startRunning() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession?.startRunning()
        }
    }
    
    // Função para tirar a foto
    func capturePhoto() {
        guard let captureSession = captureSession, captureSession.isRunning else { return }
        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.addOutput(photoOutput)
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // Delegate: Recebe a foto capturada
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let photoData = photo.fileDataRepresentation(), let image = UIImage(data: photoData) else {
            self.image = nil
            return
        }
        self.image = image
    }
    
    // Função para obter o previewLayer
    func getPreviewLayer() -> AVCaptureVideoPreviewLayer? {
        return previewLayer
    }
}

struct CameraView: View {
    @State private var resultText: String = "Select or take a photo to recognize the bird species."
    @StateObject private var cameraController = CameraController()
    @State private var isImagePickerPresented = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            // Exibe a imagem selecionada ou a imagem da câmera, se existir
            if let image = selectedImage ?? cameraController.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(Text("No image selected"))
            }

            // Exibe o texto do resultado
            Text(resultText)
                .padding()

            // Botões para selecionar a imagem ou tirar foto
            HStack {
                Button(action: {
                    sourceType = .photoLibrary
                    DispatchQueue.main.async {
                        isImagePickerPresented = true
                    }
                }) {
                    Text("Select from Gallery")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    sourceType = .camera
                    DispatchQueue.main.async {
                        isImagePickerPresented = true
                    }
                }) {
                    Text("Take Photo")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            // Exibe o preview da câmera apenas se a imagem ainda não foi capturada
            if cameraController.image == nil {
                CameraPreviewView(cameraController: cameraController)
                    .frame(height: 300)
            }
        }
        .onAppear {
            cameraController.startRunning() // Inicia a captura da câmera na inicialização
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage, sourceType: sourceType)
                .onChange(of: selectedImage) { newImage in
                    if let newImage = newImage {
                        detectBirdSpecies(for: newImage)
                    }
                }
        }
    }
    
    func detectBirdSpecies(for image: UIImage?) {
        guard let image = image, let model = try? VNCoreMLModel(for: bird().model) else {
            resultText = "Failed to load model or image"
            return
        }
        let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 224, height: 224))
        guard let ciImage = CIImage(image: resizedImage) else {
            resultText = "Could not convert UIImage to CIImage"
            return
        }
        let request = VNCoreMLRequest(model: model) { request, error in
            if let results = request.results as? [VNClassificationObservation], let topResult = results.first {
                DispatchQueue.main.async {
                    resultText = "Species: \(topResult.identifier) with confidence \(topResult.confidence * 100)%"
                }
            } else {
                DispatchQueue.main.async {
                    resultText = "Could not recognize the species"
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                DispatchQueue.main.async {
                    resultText = "Failed to perform request: \(error.localizedDescription)"
                }
            }
        }
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scale = max(widthRatio, heightRatio)
        let newSize = CGSize(width: size.width * scale, height: size.height * scale)
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0)
        let rect = CGRect(x: (targetSize.width - newSize.width) / 2, y: (targetSize.height - newSize.height) / 2, width: newSize.width, height: newSize.height)
        image.draw(in: rect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage ?? image
    }
}

struct CameraPreviewView: UIViewRepresentable {
    var cameraController: CameraController
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        if let previewLayer = cameraController.getPreviewLayer() {
            previewLayer.frame = view.bounds
            view.layer.addSublayer(previewLayer)
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.image = pickedImage
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


