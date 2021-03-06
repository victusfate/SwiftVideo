//
//  ViewController.swift
//  SwiftVideo
//
//  Created by messel on 10/9/14.
//  Copyright (c) 2014 messel. All rights reserved.
//

import UIKit
import GPUImage
import MobileCoreServices

import MediaPlayer


enum GPUImageShowcaseFilterType {
    case GPUIMAGE_SATURATION
    case GPUIMAGE_CONTRAST
    case GPUIMAGE_BRIGHTNESS
    case GPUIMAGE_LEVELS
    case GPUIMAGE_EXPOSURE
    case GPUIMAGE_RGB
    case GPUIMAGE_HUE
    case GPUIMAGE_WHITEBALANCE
    case GPUIMAGE_MONOCHROME
    case GPUIMAGE_FALSECOLOR
    case GPUIMAGE_SHARPEN
    case GPUIMAGE_UNSHARPMASK
    case GPUIMAGE_TRANSFORM
    case GPUIMAGE_TRANSFORM3D
    case GPUIMAGE_CROP
    case GPUIMAGE_MASK
    case GPUIMAGE_GAMMA
    case GPUIMAGE_TONECURVE
    case GPUIMAGE_HIGHLIGHTSHADOW
    case GPUIMAGE_HAZE
    case GPUIMAGE_SEPIA
    case GPUIMAGE_AMATORKA
    case GPUIMAGE_MISSETIKATE
    case GPUIMAGE_SOFTELEGANCE
    case GPUIMAGE_COLORINVERT
    case GPUIMAGE_GRAYSCALE
    case GPUIMAGE_HISTOGRAM
    case GPUIMAGE_HISTOGRAM_EQUALIZATION
    case GPUIMAGE_AVERAGECOLOR
    case GPUIMAGE_LUMINOSITY
    case GPUIMAGE_THRESHOLD
    case GPUIMAGE_ADAPTIVETHRESHOLD
    case GPUIMAGE_AVERAGELUMINANCETHRESHOLD
    case GPUIMAGE_PIXELLATE
    case GPUIMAGE_POLARPIXELLATE
    case GPUIMAGE_PIXELLATE_POSITION
    case GPUIMAGE_POLKADOT
    case GPUIMAGE_HALFTONE
    case GPUIMAGE_CROSSHATCH
    case GPUIMAGE_SOBELEDGEDETECTION
    case GPUIMAGE_PREWITTEDGEDETECTION
    case GPUIMAGE_CANNYEDGEDETECTION
    case GPUIMAGE_THRESHOLDEDGEDETECTION
    case GPUIMAGE_XYGRADIENT
    case GPUIMAGE_HARRISCORNERDETECTION
    case GPUIMAGE_NOBLECORNERDETECTION
    case GPUIMAGE_SHITOMASIFEATUREDETECTION
    case GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR
    case GPUIMAGE_BUFFER
    case GPUIMAGE_LOWPASS
    case GPUIMAGE_HIGHPASS
    case GPUIMAGE_MOTIONDETECTOR
    case GPUIMAGE_SKETCH
    case GPUIMAGE_THRESHOLDSKETCH
    case GPUIMAGE_TOON
    case GPUIMAGE_SMOOTHTOON
    case GPUIMAGE_TILTSHIFT
    case GPUIMAGE_CGA
    case GPUIMAGE_POSTERIZE
    case GPUIMAGE_CONVOLUTION
    case GPUIMAGE_EMBOSS
    case GPUIMAGE_LAPLACIAN
    case GPUIMAGE_CHROMAKEYNONBLEND
    case GPUIMAGE_KUWAHARA
    case GPUIMAGE_KUWAHARARADIUS3
    case GPUIMAGE_VIGNETTE
    case GPUIMAGE_GAUSSIAN
    case GPUIMAGE_GAUSSIAN_SELECTIVE
    case GPUIMAGE_GAUSSIAN_POSITION
    case GPUIMAGE_BOXBLUR
    case GPUIMAGE_MEDIAN
    case GPUIMAGE_BILATERAL
    case GPUIMAGE_MOTIONBLUR
    case GPUIMAGE_ZOOMBLUR
    case GPUIMAGE_IOSBLUR
    case GPUIMAGE_SWIRL
    case GPUIMAGE_BULGE
    case GPUIMAGE_PINCH
    case GPUIMAGE_SPHEREREFRACTION
    case GPUIMAGE_GLASSSPHERE
    case GPUIMAGE_STRETCH
    case GPUIMAGE_DILATION
    case GPUIMAGE_EROSION
    case GPUIMAGE_OPENING
    case GPUIMAGE_CLOSING
    case GPUIMAGE_PERLINNOISE
    case GPUIMAGE_VORONOI
    case GPUIMAGE_MOSAIC
    case GPUIMAGE_LOCALBINARYPATTERN
    case GPUIMAGE_DISSOLVE
    case GPUIMAGE_CHROMAKEY
    case GPUIMAGE_ADD
    case GPUIMAGE_DIVIDE
    case GPUIMAGE_MULTIPLY
    case GPUIMAGE_OVERLAY
    case GPUIMAGE_LIGHTEN
    case GPUIMAGE_DARKEN
    case GPUIMAGE_COLORBURN
    case GPUIMAGE_COLORDODGE
    case GPUIMAGE_LINEARBURN
    case GPUIMAGE_SCREENBLEND
    case GPUIMAGE_DIFFERENCEBLEND
    case GPUIMAGE_SUBTRACTBLEND
    case GPUIMAGE_EXCLUSIONBLEND
    case GPUIMAGE_HARDLIGHTBLEND
    case GPUIMAGE_SOFTLIGHTBLEND
    case GPUIMAGE_COLORBLEND
    case GPUIMAGE_HUEBLEND
    case GPUIMAGE_SATURATIONBLEND
    case GPUIMAGE_LUMINOSITYBLEND
    case GPUIMAGE_NORMALBLEND
    case GPUIMAGE_POISSONBLEND
    case GPUIMAGE_OPACITY
    case GPUIMAGE_CUSTOM
    case GPUIMAGE_UIELEMENT
    case GPUIMAGE_FILECONFIG
    case GPUIMAGE_FILTERGROUP
    case GPUIMAGE_FACES
    case GPUIMAGE_NUMFILTERS
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
//
//        moviePlayer = MPMoviePlayerController(contentURL: url)
//        
//        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
//        
//        self.view.addSubview(moviePlayer.view)
//        
//        moviePlayer.fullscreen = true
//        
//        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        
//        var url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
//        self.processVideo(url, size: CGSize(width: 1920,height: 1080), showOutput: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    var moviePlayer:MPMoviePlayerController!

    var movieFile: GPUImageMovie?
    var filter: GPUImageOutput?
    var movieWriter: GPUImageMovieWriter?
    var mTimer: NSTimer?
    var mSDAVAssetExportSession: SDAVAssetExportSession?
    
    @IBOutlet var oProgressLabel: UILabel?
    @IBOutlet var oProgressTimeLabel: UILabel?


    // quick uiimagepickercontroller to import a vid from library
    @IBAction func loadVideo(sender : AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
    
                var pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
                pickerController.mediaTypes = [kUTTypeMovie as AnyObject]
                pickerController.allowsEditing = false


                // example from how Chris got videos to import without an export
//                let imageManager = PHImageManager.defaultManager()
//                
//                let videoRequestOptions = PHVideoRequestOptions()
//                videoRequestOptions.deliveryMode = .HighQualityFormat
//                videoRequestOptions.version = .Current
//                videoRequestOptions.networkAccessAllowed = false
//                imageManager.requestAVAssetForVideo(nextAsset, options: videoRequestOptions, resultHandler: { (avAsset: AVAsset!, avAudioMix: AVAudioMix!, [NSObject : AnyObject]!) -> Void in
            

                // still see a compressing video step, the goal is loading raw video, is typehigh good enough?
                pickerController.videoQuality = UIImagePickerControllerQualityType.TypeHigh as UIImagePickerControllerQualityType // UIImagePickerControllerQualityType.TypeHigh
    
                self.presentViewController(pickerController, animated: true, completion: nil)
            }
    }
    // done picking video callback
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject: AnyObject])
    {
            self.dismissViewControllerAnimated(true, completion: nil)
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            println(url)
            self.processVideo(info[UIImagePickerControllerMediaURL] as! NSURL, size: CGSize(width: 1920,height: 1080), showOutput: true)
    }
    
    func createFilter(  filterType:GPUImageShowcaseFilterType, params: NSDictionary ) -> GPUImageOutput
    {
        var returnFilter: GPUImageOutput?
        var val = params.objectForKey("val") as! CGFloat
        var uival = UInt(round(val))
        
        switch filterType {
            
        case GPUImageShowcaseFilterType.GPUIMAGE_SEPIA:
        //             val = 1.0
            returnFilter = GPUImageSepiaFilter()
            var localFilter = returnFilter as! GPUImageSepiaFilter
            localFilter.intensity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_PIXELLATE:
        //             val = 0.05;
            returnFilter = GPUImagePixellateFilter();
            var localFilter = returnFilter as!  GPUImagePixellateFilter
            localFilter.fractionalWidthOfAPixel = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_POLARPIXELLATE:
        //            val = 0.05;
            returnFilter = GPUImagePolarPixellateFilter()
            var localFilter = returnFilter as!  GPUImagePolarPixellateFilter
            localFilter.pixelSize = CGSizeMake(val,val)

        case GPUImageShowcaseFilterType.GPUIMAGE_PIXELLATE_POSITION:
        //            val = 0.25;
            returnFilter = GPUImagePixellatePositionFilter()
            var localFilter = returnFilter as!  GPUImagePixellatePositionFilter
            localFilter.radius = val
            
        case GPUImageShowcaseFilterType.GPUIMAGE_POLKADOT:
        //            val = 0.05;
            returnFilter = GPUImagePolkaDotFilter()
            var localFilter = returnFilter as!  GPUImagePolkaDotFilter
            localFilter.fractionalWidthOfAPixel = val
            
        case GPUImageShowcaseFilterType.GPUIMAGE_HALFTONE:
        //            val = 0.01;
            returnFilter = GPUImageHalftoneFilter()
            var localFilter = returnFilter as!  GPUImageHalftoneFilter
            localFilter.fractionalWidthOfAPixel = val

        case GPUImageShowcaseFilterType.GPUIMAGE_CROSSHATCH:
        //            val = 0.01;
            returnFilter = GPUImageCrosshatchFilter()
            var localFilter = returnFilter as!  GPUImageCrosshatchFilter
            localFilter.crossHatchSpacing = val

        case GPUImageShowcaseFilterType.GPUIMAGE_COLORINVERT:
            returnFilter = GPUImageColorInvertFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_GRAYSCALE:
            returnFilter = GPUImageGrayscaleFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_MONOCHROME:
        //            val = 1.0;
            returnFilter = GPUImageMonochromeFilter()
            var localFilter = returnFilter as! GPUImageMonochromeFilter
            localFilter.color = GPUVector4(one:0.0, two:0.0, three:1.0, four:1.0)
            localFilter.intensity = val
            
        case GPUImageShowcaseFilterType.GPUIMAGE_FALSECOLOR:
            returnFilter = GPUImageFalseColorFilter()
            
        case GPUImageShowcaseFilterType.GPUIMAGE_SOFTELEGANCE:
            returnFilter = GPUImageSoftEleganceFilter()
            
        case GPUImageShowcaseFilterType.GPUIMAGE_MISSETIKATE:
            returnFilter = GPUImageMissEtikateFilter()
            
        case GPUImageShowcaseFilterType.GPUIMAGE_AMATORKA:
            returnFilter = GPUImageAmatorkaFilter()
       
        case GPUImageShowcaseFilterType.GPUIMAGE_SATURATION:
            //            val = 1.0;
            returnFilter = GPUImageSaturationFilter()
            var localFilter = returnFilter as! GPUImageSaturationFilter
            localFilter.saturation = val

        case GPUImageShowcaseFilterType.GPUIMAGE_CONTRAST:
            //            val = 1.0;
            returnFilter = GPUImageContrastFilter()
            var localFilter = returnFilter as! GPUImageContrastFilter
            localFilter.contrast = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_BRIGHTNESS:
            //            val = 0.2;
            returnFilter = GPUImageBrightnessFilter()
            var localFilter = returnFilter as! GPUImageBrightnessFilter
            localFilter.brightness = val

        case GPUImageShowcaseFilterType.GPUIMAGE_LEVELS:
            //            val = 0.2;
            returnFilter = GPUImageLevelsFilter()
            var localFilter = returnFilter as! GPUImageLevelsFilter

            localFilter.setRedMin(val, gamma:1.0, max:1.0, minOut:0.0, maxOut:1.0)
            localFilter.setGreenMin(val, gamma:1.0, max:1.0, minOut:0.0, maxOut:1.0)
            localFilter.setBlueMin(val, gamma:1.0, max:1.0, minOut:0.0, maxOut:1.0)

        case GPUImageShowcaseFilterType.GPUIMAGE_RGB:
            //            val = 1.0;
            returnFilter = GPUImageRGBFilter()
            var localFilter = returnFilter as! GPUImageRGBFilter

            localFilter.red = val
            //            localFilter.green = val
            //            localFilter.blue = val

        case GPUImageShowcaseFilterType.GPUIMAGE_HUE:
            //            val = 90.0;
            returnFilter = GPUImageHueFilter()
            var localFilter = returnFilter as! GPUImageHueFilter
            localFilter.hue = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_WHITEBALANCE:
            //            val = 5000.0;
            returnFilter = GPUImageWhiteBalanceFilter()
            var localFilter = returnFilter as! GPUImageWhiteBalanceFilter
            localFilter.temperature = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_EXPOSURE:
            //            val = 1.0;
            returnFilter = GPUImageExposureFilter()
            var localFilter = returnFilter as! GPUImageExposureFilter
            localFilter.exposure = val

        case GPUImageShowcaseFilterType.GPUIMAGE_SHARPEN:
            //            val = 1.0;
            returnFilter = GPUImageSharpenFilter()
            var localFilter = returnFilter as! GPUImageSharpenFilter
            localFilter.sharpness = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_UNSHARPMASK:
            //            val = 1.0;
            returnFilter = GPUImageUnsharpMaskFilter()
            var localFilter = returnFilter as! GPUImageUnsharpMaskFilter
            localFilter.intensity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_GAMMA:
            //            val = 1.0;
            returnFilter = GPUImageGammaFilter()
            var localFilter = returnFilter as! GPUImageGammaFilter
            localFilter.gamma = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_TONECURVE:
            //            val = 0.5;
            let valHi = 1.5 * val;
            returnFilter = GPUImageToneCurveFilter()
            
            var localFilter = returnFilter as! GPUImageToneCurveFilter
            localFilter.redControlPoints = [
                NSValue(CGPoint:CGPointMake(0.0, 0.0)),
                NSValue(CGPoint:CGPointMake(0.5, 0.5)),
                NSValue(CGPoint:CGPointMake(1.0, 1.0)) ]
            localFilter.greenControlPoints = [
                NSValue(CGPoint:CGPointMake(0.0, 0.0)),
                NSValue(CGPoint:CGPointMake(0.5, 0.5)),
                NSValue(CGPoint:CGPointMake(1.0, 1.0)) ]
            localFilter.blueControlPoints = [
                NSValue(CGPoint:CGPointMake(0.0, 0.0)),
                NSValue(CGPoint:CGPointMake(0.5, val)),
                NSValue(CGPoint:CGPointMake(1.0, valHi)) ]

        case GPUImageShowcaseFilterType.GPUIMAGE_HIGHLIGHTSHADOW:
            //            val = 1.0;
            returnFilter = GPUImageHighlightShadowFilter()
            var localFilter = returnFilter as! GPUImageHighlightShadowFilter
            localFilter.highlights = val

        case GPUImageShowcaseFilterType.GPUIMAGE_HAZE:
            //            val = 0.2;
            returnFilter = GPUImageHazeFilter()
            var localFilter = returnFilter as! GPUImageHazeFilter
            localFilter.distance = val

        case GPUImageShowcaseFilterType.GPUIMAGE_AVERAGECOLOR:
            returnFilter = GPUImageAverageColor()

        case GPUImageShowcaseFilterType.GPUIMAGE_LUMINOSITY:
            returnFilter = GPUImageLuminosity()

        case GPUImageShowcaseFilterType.GPUIMAGE_HISTOGRAM:
            //            val = 16.0;
            returnFilter = GPUImageHistogramFilter(histogramType: kGPUImageHistogramRGB)
            var localFilter = returnFilter as! GPUImageHistogramFilter
            localFilter.downsamplingFactor = uival

        case GPUImageShowcaseFilterType.GPUIMAGE_HISTOGRAM_EQUALIZATION:
            //            val = 16.0;
            returnFilter = GPUImageHistogramEqualizationFilter(histogramType: kGPUImageHistogramLuminance)
            var localFilter = returnFilter as! GPUImageHistogramEqualizationFilter
            localFilter.downsamplingFactor = uival

        case GPUImageShowcaseFilterType.GPUIMAGE_THRESHOLD:
            //            val = 0.5;
            returnFilter = GPUImageLuminanceThresholdFilter()
            var localFilter = returnFilter as! GPUImageLuminanceThresholdFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_ADAPTIVETHRESHOLD:
            //            val = 1.0;
            returnFilter = GPUImageAdaptiveThresholdFilter()
            var localFilter = returnFilter as! GPUImageAdaptiveThresholdFilter
            localFilter.blurRadiusInPixels = val

        case GPUImageShowcaseFilterType.GPUIMAGE_AVERAGELUMINANCETHRESHOLD:
            //            val = 1.0;
            returnFilter = GPUImageAverageLuminanceThresholdFilter()
            var localFilter = returnFilter as! GPUImageAverageLuminanceThresholdFilter
            localFilter.thresholdMultiplier = val

        case GPUImageShowcaseFilterType.GPUIMAGE_CROP:
            //            val = 0.5;
            returnFilter = GPUImageCropFilter( cropRegion: CGRectMake(0.0, 0.0, 1.0, val))
            //            localFilter.cropRegion = CGRectMake(0.0, 0.0, 1.0, val)

        case GPUImageShowcaseFilterType.GPUIMAGE_MASK:
            returnFilter = GPUImageMaskFilter()
            var localFilter = returnFilter as! GPUImageMaskFilter
            localFilter.setBackgroundColorRed(0.0, green:1.0, blue:0.0, alpha:1.0)
        

        case GPUImageShowcaseFilterType.GPUIMAGE_TRANSFORM:
            //            val = 2.0;
            returnFilter = GPUImageTransformFilter()
            var localFilter = returnFilter as! GPUImageTransformFilter
            localFilter.affineTransform = CGAffineTransformMakeRotation(2.0)
            //            localFilter.setIgnoreAspectRatio(true);

        case GPUImageShowcaseFilterType.GPUIMAGE_TRANSFORM3D:
            //            val = 0.75;
            returnFilter = GPUImageTransformFilter()
            var perspectiveTransform = CATransform3DIdentity
            perspectiveTransform.m34 = 0.4
            perspectiveTransform.m33 = 0.4
            perspectiveTransform = CATransform3DScale(perspectiveTransform,val, val, val)
            perspectiveTransform = CATransform3DRotate(perspectiveTransform, val, 0.0, 1.0, 0.0)
            
            var localFilter = returnFilter as! GPUImageTransformFilter
            localFilter.transform3D = perspectiveTransform

        case GPUImageShowcaseFilterType.GPUIMAGE_SOBELEDGEDETECTION:
            //            val = 0.25;
            returnFilter = GPUImageSobelEdgeDetectionFilter()
            var localFilter = returnFilter as! GPUImageSobelEdgeDetectionFilter
            localFilter.edgeStrength = val

        case GPUImageShowcaseFilterType.GPUIMAGE_XYGRADIENT:
            returnFilter = GPUImageXYDerivativeFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_HARRISCORNERDETECTION:
            //            val = 0.2;
            returnFilter = GPUImageHarrisCornerDetectionFilter()
            var localFilter = returnFilter as! GPUImageHarrisCornerDetectionFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_NOBLECORNERDETECTION:
            //            val = 0.2;
            returnFilter = GPUImageNobleCornerDetectionFilter()
            var localFilter = returnFilter as! GPUImageNobleCornerDetectionFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_SHITOMASIFEATUREDETECTION:
            //            val = 0.2;
            returnFilter = GPUImageShiTomasiFeatureDetectionFilter()
            var localFilter = returnFilter as! GPUImageShiTomasiFeatureDetectionFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR:
            //            val = 0.6;
            returnFilter = GPUImageHoughTransformLineDetector()
            var localFilter = returnFilter as! GPUImageHoughTransformLineDetector
            localFilter.lineDetectionThreshold = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_PREWITTEDGEDETECTION:
            //            val = 1.0;
            returnFilter = GPUImagePrewittEdgeDetectionFilter()
            var localFilter = returnFilter as! GPUImagePrewittEdgeDetectionFilter
            localFilter.edgeStrength = val
        
        case GPUImageShowcaseFilterType.GPUIMAGE_CANNYEDGEDETECTION:
            //            val = 1.0;
            returnFilter = GPUImageCannyEdgeDetectionFilter()
            var localFilter = returnFilter as! GPUImageCannyEdgeDetectionFilter
            localFilter.blurTexelSpacingMultiplier = val

        case GPUImageShowcaseFilterType.GPUIMAGE_THRESHOLDEDGEDETECTION:
            //            val = 0.25;
            returnFilter = GPUImageThresholdEdgeDetectionFilter()
            var localFilter = returnFilter as! GPUImageThresholdEdgeDetectionFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_LOCALBINARYPATTERN:
            //            val = 1.0;
            returnFilter = GPUImageLocalBinaryPatternFilter()
            let multiplier = val as CGFloat;
            var localFilter = returnFilter as! GPUImageLocalBinaryPatternFilter
            localFilter.texelWidth = multiplier / self.view.bounds.size.width
            localFilter.texelHeight = multiplier / self.view.bounds.size.height

        case GPUImageShowcaseFilterType.GPUIMAGE_BUFFER:
            returnFilter = GPUImageBuffer()

        case GPUImageShowcaseFilterType.GPUIMAGE_LOWPASS:
            //            val = 0.5;
            returnFilter = GPUImageLowPassFilter()
            var localFilter = returnFilter as! GPUImageLowPassFilter
            localFilter.filterStrength = val

        case GPUImageShowcaseFilterType.GPUIMAGE_HIGHPASS:
            //            val = 0.5;
            returnFilter = GPUImageHighPassFilter()
            var localFilter = returnFilter as! GPUImageHighPassFilter
            localFilter.filterStrength = val

        case GPUImageShowcaseFilterType.GPUIMAGE_MOTIONDETECTOR:
            //            val = 0.5;
            returnFilter = GPUImageMotionDetector()
            var localFilter = returnFilter as! GPUImageMotionDetector
            localFilter.lowPassFilterStrength = val

        case GPUImageShowcaseFilterType.GPUIMAGE_SKETCH:
            //            val = 0.25;
            returnFilter = GPUImageSketchFilter()
            var localFilter = returnFilter as! GPUImageSketchFilter
            localFilter.edgeStrength = val

        case GPUImageShowcaseFilterType.GPUIMAGE_THRESHOLDSKETCH:
            //            val = 0.25;
            returnFilter = GPUImageThresholdSketchFilter()
            var localFilter = returnFilter as! GPUImageThresholdSketchFilter
            localFilter.threshold = val

        case GPUImageShowcaseFilterType.GPUIMAGE_TOON:
            returnFilter = GPUImageToonFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_SMOOTHTOON:
            //            val = 1.0;
            returnFilter = GPUImageSmoothToonFilter()
            var localFilter = returnFilter as! GPUImageSmoothToonFilter
            localFilter.blurRadiusInPixels = val

        case GPUImageShowcaseFilterType.GPUIMAGE_TILTSHIFT:
            //            val = 0.5;
            returnFilter = GPUImageTiltShiftFilter()
            var localFilter = returnFilter as! GPUImageTiltShiftFilter
            localFilter.topFocusLevel = val - 0.1
            localFilter.bottomFocusLevel = val + 0.1
            localFilter.focusFallOffRate = 0.2

        case GPUImageShowcaseFilterType.GPUIMAGE_CGA:
            returnFilter = GPUImageCGAColorspaceFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_CONVOLUTION:
            returnFilter = GPUImage3x3ConvolutionFilter()
            //            [(GPUImage3x3ConvolutionFilter *)localFilter.setConvolutionKernel:(GPUMatrix3x3){
            //                {-2.0f, -1.0f, 0.0f},
            //                {-1.0f,  1.0f, 1.0f},
            //                { 0.0f,  1.0f, 2.0f}
            //            }];
            var localFilter = returnFilter as! GPUImage3x3ConvolutionFilter
            localFilter.convolutionKernel.one = GPUVector3(one: -1.0,two: 0.0,three: 1.0)
            localFilter.convolutionKernel.two = GPUVector3(one: -2.0,two: 0.0,three: 2.0)
            localFilter.convolutionKernel.three = GPUVector3(one: -1.0,two: 0.0,three: 1.0)
            
            //            [(GPUImage3x3ConvolutionFilter *)localFilter.setConvolutionKernel:(GPUMatrix3x3){
            //                {1.0f,  1.0f, 1.0f},
            //                {1.0f, -8.0f, 1.0f},
            //                {1.0f,  1.0f, 1.0f}
            //            }];
            //            [(GPUImage3x3ConvolutionFilter *)localFilter.setConvolutionKernel:(GPUMatrix3x3){
            //                { 0.11f,  0.11f, 0.11f},
            //                { 0.11f,  0.11f, 0.11f},
            //                { 0.11f,  0.11f, 0.11f}
            //            }];

        case GPUImageShowcaseFilterType.GPUIMAGE_EMBOSS:
            //            val = 1.0;
            returnFilter = GPUImageEmbossFilter()
            var localFilter = returnFilter as! GPUImageEmbossFilter
            localFilter.intensity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_LAPLACIAN:
            returnFilter = GPUImageLaplacianFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_POSTERIZE:
            //            val = 10.0;
            returnFilter = GPUImagePosterizeFilter()
            var localFilter = returnFilter as! GPUImagePosterizeFilter
            localFilter.colorLevels = uival

        case GPUImageShowcaseFilterType.GPUIMAGE_SWIRL:
            //            val = 1.0;
            returnFilter = GPUImageSwirlFilter()
            var localFilter = returnFilter as! GPUImageSwirlFilter
            localFilter.angle = val

        case GPUImageShowcaseFilterType.GPUIMAGE_BULGE:
            //            val = 0.5;
            returnFilter = GPUImageBulgeDistortionFilter()
            var localFilter = returnFilter as! GPUImageBulgeDistortionFilter
            localFilter.scale = val

        case GPUImageShowcaseFilterType.GPUIMAGE_SPHEREREFRACTION:
            //            val = 0.15;
            returnFilter = GPUImageSphereRefractionFilter()
            var localFilter = returnFilter as! GPUImageSphereRefractionFilter
            localFilter.radius = val

        case GPUImageShowcaseFilterType.GPUIMAGE_GLASSSPHERE:
            //            val = 0.15;
            returnFilter = GPUImageGlassSphereFilter()
            var localFilter = returnFilter as! GPUImageGlassSphereFilter
            localFilter.radius = val

        case GPUImageShowcaseFilterType.GPUIMAGE_PINCH:
            //            val = 0.5;
            returnFilter = GPUImagePinchDistortionFilter()
            var localFilter = returnFilter as! GPUImagePinchDistortionFilter
            localFilter.scale = val

        case GPUImageShowcaseFilterType.GPUIMAGE_STRETCH:
            returnFilter = GPUImageStretchDistortionFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_DILATION:
            //            val = 4.0;
            returnFilter = GPUImageRGBDilationFilter( radius: uival)

        case GPUImageShowcaseFilterType.GPUIMAGE_EROSION:
            //            val = 4.0;
            returnFilter = GPUImageRGBErosionFilter( radius: uival)

        case GPUImageShowcaseFilterType.GPUIMAGE_OPENING:
            //            val = 4.0;
            returnFilter = GPUImageRGBOpeningFilter( radius: uival )

        case GPUImageShowcaseFilterType.GPUIMAGE_CLOSING:
            //            val = 4.0;
            returnFilter = GPUImageRGBClosingFilter( radius: uival)
        
        case GPUImageShowcaseFilterType.GPUIMAGE_PERLINNOISE:
            //            val = 8.0;
            returnFilter = GPUImagePerlinNoiseFilter()
            var localFilter = returnFilter as! GPUImagePerlinNoiseFilter
            localFilter.scale = Float(val)

        case GPUImageShowcaseFilterType.GPUIMAGE_VORONOI:
            //            self.title = @"Voronoi";
            //            self.filterSettingsSlider.hidden = YES;
            //
            //            GPUImageJFAVoronoiFilter jfa = GPUImageJFAVoronoiFilter()
            //            jfa.sizeInPixels = CGSizeMake(1024.0, 1024.0)
            //
            //            sourcePicture = GPUImagePicture().initWithImage("voroni_points2.png")
            //
            //            sourcePicture.addTarget(jfa)
            //
            //            returnFilter = GPUImageVoronoiConsumerFilter()
            //
            //            jfa.sizeInPixels = CGSizeMake(1024.0, 1024.0)
            //            var localFilter = returnFilter as! GPUImageVornoiConsumerFilter
            //            localFilter.sizeInPixels = CGSizeMake(1024.0, 1024.0)
            //
            //
            //            videoCamera.addTarget(filter)
            //            jfa.addTarget(filter)
            //            sourcePicture.(processImage)
            NSException(name:"GPUIMAGE_VORNOI unsupported", reason: "GPUIMAGE_VORNOI is unsupported", userInfo:nil).raise()

        case GPUImageShowcaseFilterType.GPUIMAGE_MOSAIC:
            //            val = 0.025;
            returnFilter = GPUImageMosaicFilter()
            var localFilter = returnFilter as! GPUImageMosaicFilter
            localFilter.displayTileSize = CGSizeMake(val,val)
            localFilter.tileSet = "squares.png"
            localFilter.colorOn = false
//            localFilter.tileSet = "dotletterstiles.png"
//            localFilter.tileSet = "curvies.png"
            
        case GPUImageShowcaseFilterType.GPUIMAGE_CHROMAKEY:
            //            val = 0.4;
            returnFilter = GPUImageChromaKeyBlendFilter()
            var localFilter = returnFilter as! GPUImageChromaKeyBlendFilter
            localFilter.setColorToReplaceRed(0.0, green:1.0, blue:0.0)
            localFilter.thresholdSensitivity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_CHROMAKEYNONBLEND:
            //            val = 0.4;
            returnFilter = GPUImageChromaKeyFilter()
            var localFilter = returnFilter as! GPUImageChromaKeyFilter
            localFilter.setColorToReplaceRed(0.0, green: 1.0, blue: 0.0)
            localFilter.thresholdSensitivity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_ADD:
            returnFilter = GPUImageAddBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_DIVIDE:
            returnFilter = GPUImageDivideBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_MULTIPLY:
            returnFilter = GPUImageMultiplyBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_OVERLAY:
            returnFilter = GPUImageOverlayBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_LIGHTEN:
            returnFilter = GPUImageLightenBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_DARKEN:
            returnFilter = GPUImageDarkenBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_DISSOLVE:
            //            val = 0.5;
            returnFilter = GPUImageDissolveBlendFilter()
            var localFilter = returnFilter as! GPUImageDissolveBlendFilter
            localFilter.mix = val

        case GPUImageShowcaseFilterType.GPUIMAGE_SCREENBLEND:
            returnFilter = GPUImageScreenBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_COLORBURN:
            returnFilter = GPUImageColorBurnBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_COLORDODGE:
            returnFilter = GPUImageColorDodgeBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_LINEARBURN:
            returnFilter = GPUImageLinearBurnBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_EXCLUSIONBLEND:
            returnFilter = GPUImageExclusionBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_DIFFERENCEBLEND:
            returnFilter = GPUImageDifferenceBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_SUBTRACTBLEND:
            returnFilter = GPUImageSubtractBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_HARDLIGHTBLEND:
            returnFilter = GPUImageHardLightBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_SOFTLIGHTBLEND:
            returnFilter = GPUImageSoftLightBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_COLORBLEND:
            returnFilter = GPUImageColorBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_HUEBLEND:
            returnFilter = GPUImageHueBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_SATURATIONBLEND:
            returnFilter = GPUImageSaturationBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_LUMINOSITYBLEND:
            returnFilter = GPUImageLuminosityBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_NORMALBLEND:
            returnFilter = GPUImageNormalBlendFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_POISSONBLEND:
            //            val = 0.5;
            returnFilter = GPUImagePoissonBlendFilter()
            var localFilter = returnFilter as! GPUImagePoissonBlendFilter
            localFilter.mix = val

        case GPUImageShowcaseFilterType.GPUIMAGE_OPACITY:
            //            val = 1.0;
            returnFilter = GPUImageOpacityFilter()
            var localFilter = returnFilter as! GPUImageOpacityFilter
            localFilter.opacity = val

        case GPUImageShowcaseFilterType.GPUIMAGE_CUSTOM:
            returnFilter = GPUImageFilter(fragmentShaderFromFile: "CustomFilter");
//            returnFilter = GPUImageFilter(fragmentShaderFromString: "sShader" as NSString);

        case GPUImageShowcaseFilterType.GPUIMAGE_KUWAHARA:
            //            val = 3.0;
            returnFilter = GPUImageKuwaharaFilter()
            var localFilter = returnFilter as! GPUImageKuwaharaFilter
            localFilter.radius = uival

        case GPUImageShowcaseFilterType.GPUIMAGE_KUWAHARARADIUS3:
            returnFilter = GPUImageKuwaharaRadius3Filter()

        case GPUImageShowcaseFilterType.GPUIMAGE_VIGNETTE:
            //            val = 0.75;
            returnFilter = GPUImageVignetteFilter()
            var localFilter = returnFilter as! GPUImageVignetteFilter
            localFilter.vignetteEnd = val

        case GPUImageShowcaseFilterType.GPUIMAGE_GAUSSIAN:
            //            val = 2.0;
            returnFilter = GPUImageGaussianBlurFilter()
            var localFilter = returnFilter as! GPUImageGaussianBlurFilter
            localFilter.blurRadiusInPixels = val

        case GPUImageShowcaseFilterType.GPUIMAGE_BOXBLUR:
            //            val = 2.0;
            returnFilter = GPUImageBoxBlurFilter()
            var localFilter = returnFilter as! GPUImageBoxBlurFilter
            localFilter.blurRadiusInPixels = val

        case GPUImageShowcaseFilterType.GPUIMAGE_MEDIAN:
            returnFilter = GPUImageMedianFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_MOTIONBLUR:
            //            val = 0.0;
            returnFilter = GPUImageMotionBlurFilter()
            var localFilter = returnFilter as! GPUImageMotionBlurFilter
            localFilter.blurAngle = val

        case GPUImageShowcaseFilterType.GPUIMAGE_ZOOMBLUR:
            //            val = 1.0;
            returnFilter = GPUImageZoomBlurFilter()
            var localFilter = returnFilter as! GPUImageZoomBlurFilter
            localFilter.blurSize = val

        case GPUImageShowcaseFilterType.GPUIMAGE_IOSBLUR:
            returnFilter = GPUImageiOSBlurFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_UIELEMENT:
            returnFilter = GPUImageSepiaFilter()

        case GPUImageShowcaseFilterType.GPUIMAGE_GAUSSIAN_SELECTIVE:
            //            val = 40.0/320.0;
            returnFilter = GPUImageGaussianSelectiveBlurFilter()
            var localFilter = returnFilter as! GPUImageGaussianSelectiveBlurFilter
            localFilter.excludeCircleRadius = val

        case GPUImageShowcaseFilterType.GPUIMAGE_GAUSSIAN_POSITION:
        //            val = 40.0/320.0;
            returnFilter = GPUImageGaussianBlurPositionFilter()
            var localFilter = returnFilter as! GPUImageGaussianBlurPositionFilter
            localFilter.blurRadius = val

        case GPUImageShowcaseFilterType.GPUIMAGE_BILATERAL:
            //            val = 1.0;
            returnFilter = GPUImageBilateralFilter()
            var localFilter = returnFilter as! GPUImageBilateralFilter
            localFilter.distanceNormalizationFactor = val
        

        case GPUImageShowcaseFilterType.GPUIMAGE_FILTERGROUP:
            //            val = 0.05;
            returnFilter = GPUImageFilterGroup()
            var localFilter = returnFilter as! GPUImageFilterGroup
            
            var sepiaFilter = GPUImageSepiaFilter()
            sepiaFilter.intensity = val
            localFilter.addFilter(sepiaFilter)
            
            var pixellateFilter = GPUImagePixellateFilter()
            pixellateFilter.fractionalWidthOfAPixel = val
            localFilter.addFilter(pixellateFilter)
            
            sepiaFilter.addTarget(pixellateFilter)

            localFilter.initialFilters = NSArray(array: [sepiaFilter]) as [AnyObject]
            localFilter.terminalFilter = pixellateFilter

            
        case GPUImageShowcaseFilterType.GPUIMAGE_FACES:
            //            val = 1.0;
            returnFilter = GPUImageSaturationFilter()
            var localFilter = returnFilter as! GPUImageSaturationFilter
            localFilter.saturation = val

            
        default: returnFilter = GPUImageSepiaFilter()
            
        }
        
        return returnFilter!
    
    }
    
    
    
    func applyFilters()
    {
        // placeholder for interactive filter selection
//        var filter1: GPUImageOutput = self.createFilter( GPUImageShowcaseFilterType.GPUIMAGE_ZOOMBLUR, params: NSDictionary(dictionary: ["val":1.0]))
//        var filter2: GPUImageOutput = self.createFilter( GPUImageShowcaseFilterType.GPUIMAGE_BULGE, params: NSDictionary(dictionary:["val":0.75]))
//        var aFilters: [GPUImageOutput] = [filter1,filter2]
        
        var filter1: GPUImageOutput = self.createFilter( GPUImageShowcaseFilterType.GPUIMAGE_TONECURVE, params: NSDictionary(dictionary: ["val":1.0]))
         var aFilters: [GPUImageOutput] = [filter1]
        
        // arbitrary filter application
        var nFilters = aFilters.count
        var prevFilter : GPUImageOutput?
        var i = 0
        for currentFilter in aFilters
        {
            if (i == 0) {
                self.movieFile?.addTarget(currentFilter as! GPUImageInput)
            }

            if (i != 0 && i != nFilters-1) {
                prevFilter?.addTarget(currentFilter as! GPUImageInput)
            }

            if (i != nFilters-1) {
                prevFilter = currentFilter;
            }
            i++;
        }
        self.filter = aFilters[nFilters-1];
        if (i > 1) {
            prevFilter?.addTarget(self.filter as! GPUImageInput);
        }

    }
 
    // handy progress/timer from Marc's VideoBench
    func getTimerElapsedTime( timer: NSTimer) -> String
    {
        var aTimeInterval = NSDate().timeIntervalSinceDate( self.mTimer?.userInfo as! NSDate)
        return String(format: "%0.2f" as String, aTimeInterval)
    }

    func retrievingProgress()
    {
        var aProgress = 0.0 as Float
        if self.movieFile != nil {
            aProgress = self.movieFile!.progress
        }
        else if self.mSDAVAssetExportSession != nil {
            aProgress = self.mSDAVAssetExportSession!.progress
        }
        var iProgress = UInt(round(aProgress * 100))
        var theText = String(format: "%d%%" as String, iProgress as CVarArgType)
        self.oProgressLabel?.text = theText
        self.oProgressTimeLabel?.text = self.getTimerElapsedTime(self.mTimer!)
    }
    
    func startTimer()
    {
        self.mTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector:  "retrievingProgress", userInfo: NSDate(), repeats: true)
    }

    
    func getOutputPath() -> String
    {
        return NSHomeDirectory().stringByAppendingPathComponent("Documents/Movie.mov")
    }
    
    func getOutputURL() -> NSURL
    {
        var pathToMovie = getOutputPath();
        unlink(pathToMovie) // delete existing file
        return NSURL(fileURLWithPath: pathToMovie)!
    }
    
    // Returns a display string of the output file size ex. 234MB
    func outputFileSize() -> String
    {
        var pathToMovie = getOutputPath();
        var anAttributesError : NSError?
        var oError : NSError? = nil
//        var aFileAttributes : NSObject = NSFileManager().attributesOfItemAtPath(path: pathToMovie, error: error)

        let manager = NSFileManager.defaultManager()
        var aFileAttributes = NSDictionary(dictionary: manager.attributesOfItemAtPath( pathToMovie, error : &oError)!)
    
        if (aFileAttributes.count > 0)
        {
            var aFileSizeString = aFileAttributes.objectForKey(NSFileSize) as! Int
    
            return String(aFileSizeString)
        }
        else
        {
            return String(0)
        }
    }
    
   
    // done writing video callback
    func videoSaved(videoSaved: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Void>)       {
        
        if error != nil {
            println("videoSaved: \(error)")
        }
        
        dispatch_async(dispatch_get_main_queue(), {
            self.mTimer?.invalidate()

            self.oProgressLabel?.text = "0%"
            self.oProgressTimeLabel?.text = "0"
            
            //                self.oProgressLabel.text = "Done";
            
            // cleanup
            self.movieFile = nil;
            self.movieWriter = nil;
            self.mTimer = nil;
            self.filter = nil;
        })
    }
    
    // actually process selected video
    func processVideo( fileURL: NSURL, size: CGSize, showOutput: Bool)
    {
        self.movieFile = GPUImageMovie(URL: fileURL as NSURL)
        
        self.movieFile?.runBenchmark = false
        self.movieFile?.playAtActualSpeed = false;
        
        self.applyFilters()
        
        // show the video for display in case needed
        if (showOutput)
        {
            self.filter?.addTarget(self.view as! GPUImageView)
        }
        
        // lets create a movieWriter
        // Setup AverageBitRate, FrameInterval, and ProfileLevel (Compression Properties)

        /*
        NSDictionary *videoCleanApertureSettings = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt:videoSize.width], AVVideoCleanApertureWidthKey,
        [NSNumber numberWithInt:videoSize.height], AVVideoCleanApertureHeightKey,
        [NSNumber numberWithInt:0], AVVideoCleanApertureHorizontalOffsetKey,
        [NSNumber numberWithInt:0], AVVideoCleanApertureVerticalOffsetKey,
        nil];
        
        NSDictionary *videoAspectRatioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt:3], AVVideoPixelAspectRatioHorizontalSpacingKey,
        [NSNumber numberWithInt:3], AVVideoPixelAspectRatioVerticalSpacingKey,
        nil];
        
        NSMutableDictionary * compressionProperties = [[NSMutableDictionary alloc] init];
        [compressionProperties setObject:videoCleanApertureSettings forKey:AVVideoCleanApertureKey];
        [compressionProperties setObject:videoAspectRatioSettings forKey:AVVideoPixelAspectRatioKey];
        [compressionProperties setObject:[NSNumber numberWithInt: 2000000] forKey:AVVideoAverageBitRateKey];
        [compressionProperties setObject:[NSNumber numberWithInt: 16] forKey:AVVideoMaxKeyFrameIntervalKey];
        [compressionProperties setObject:AVVideoProfileLevelH264Main31 forKey:AVVideoProfileLevelKey];
        
        [outputSettings setObject:compressionProperties forKey:AVVideoCompressionPropertiesKey];
        */
        var videoCleanApertureSettings = NSDictionary(dictionary: [
            "AVVideoCleanApertureWidthKey": size.width,
            "AVVideoCleanApertureHeightKey": size.height,
            "AVVideoCleanApertureHorizontalOffsetKey": 0,
            "AVVideoCleanApertureVerticalOffsetKey": 0
            ])
        
        var videoAspectRatioSettings = NSDictionary(dictionary: [
            "AVVideoPixelAspectRatioHorizontalSpacingKey": 3,
            "AVVideoPixelAspectRatioVerticalSpacingKey": 3
            ])
        
        var compressionProperties = NSDictionary(dictionary: [
            "AVVideoCleanApertureKey": videoCleanApertureSettings,
            "AVVideoPixelAspectRatioKey": videoAspectRatioSettings,
            "AVVideoAverageBitRateKey":17000000,
            "AVVideoMaxKeyFrameIntervalKey": 16,
            "AVVideoProfileLevelKey": AVVideoProfileLevelH264Main41
            ])
        
        var oOutputSettings = NSDictionary(dictionary: [
            "AVVideoCodecKey":AVVideoCodecH264,
            "AVVideoWidthKey": size.width,
            "AVVideoHeightKey": size.height,
            "AVVideoCompressionPropertiesKey": compressionProperties
            ])
        
        // fileType: AVFileTypeQuickTimeMovie, AVFileTypeAppleM4A,AVFileTypeAppleM4V, AVFileTypeMPEG4
        // [AVAssetWriterInput initWithMediaType:outputSettings:sourceFormatHint:] 
        //   Compression property AVVideoAverageBitRateKey is not supported for video codec type avc1'
//        self.movieWriter = GPUImageMovieWriter(movieURL: self.getOutputURL(), size: size, fileType: AVFileTypeQuickTimeMovie, outputSettings: oOutputSettings)

        self.movieWriter = GPUImageMovieWriter(movieURL: self.getOutputURL(), size: size)
        self.filter?.addTarget(self.movieWriter as! GPUImageInput)
        
        // Configure this for video from the movie file, where we want to
        // preserve all video frames and audio samples
        self.movieWriter?.shouldPassthroughAudio = true
        self.movieFile?.audioEncodingTarget = movieWriter
        self.movieFile?.enableSynchronizedEncodingUsingMovieWriter(movieWriter)
        
        self.movieWriter?.startRecording()
        self.movieFile?.startProcessing()
        
        self.startTimer()
        

//        __weak typeof(self) wSelf = self;
        
        // Completion handler
        // didn't seem to need the weak self stuff, not 100% clear on it
//        self.movieWriter?.completionBlock = {[weak self] in
        self.movieWriter?.completionBlock = {

            
            var elapsedTime = self.getTimerElapsedTime(self.mTimer!)
            println("GPUPImage + OpenGL output height: \(size.height) showOutput: \(showOutput) elasped time: \(elapsedTime)s file size: \(self.outputFileSize()) bytes")
            
            self.filter?.removeTarget(self.movieWriter as! GPUImageInput)
            self.movieWriter?.finishRecording()
            
//            var wSelf = [weak self]

            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(self.getOutputPath())) {
                UISaveVideoAtPathToSavedPhotosAlbum(self.getOutputPath(), self,  "videoSaved:didFinishSavingWithError:contextInfo:", nil)
//                UISaveVideoAtPathToSavedPhotosAlbum(self.getOutputPath(), self,  nil, nil)
            }
           
        }
    }
    

}



