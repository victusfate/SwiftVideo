//
//  ViewController.swift
//  SwiftVideo
//
//  Created by messel on 10/9/14.
//  Copyright (c) 2014 messel. All rights reserved.
//

import UIKit
import GPUImage

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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var session: SDAVAssetExportSession
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    var movieFile: GPUImageMovie?
    var filter: GPUImageOutput?
    var movieWriter: GPUImageMovieWriter?
    var mTimer: NSTimer?
    var mBenchmarks: Array = []
    var mSDAVAssetExportSession: SDAVAssetExportSession?
    
    
    func createFilter(  filterType:GPUImageShowcaseFilterType, val: Float32) -> GPUImageFilter
    {
        var pFilter: GPUImageFilter?
        
        switch filterType
        {
            
            case GPUImageShowcaseFilterType.GPUIMAGE_SEPIA:
            
                //            val = 1.0;
                pFilter = GPUImageSepiaFilter();
                (pFilter as GPUImageSepiaFilter).setIntensity(val)
            
/*            case GPUIMAGE_PIXELLATE:
            {
            //            val = 0.05;
            pFilter = [[GPUImagePixellateFilter alloc] init];
            [(GPUImagePixellateFilter*)pFilter setFractionalWidthOfAPixel:val];
            }
            case GPUIMAGE_POLARPIXELLATE:
            {
            //            val = 0.05;
            pFilter = [[GPUImagePolarPixellateFilter alloc] init];
            [(GPUImagePolarPixellateFilter*)pFilter setPixelSize:CGSizeMake(val,val)];
            }
            case GPUIMAGE_PIXELLATE_POSITION:
            {
            //            val = 0.25;
            pFilter = [[GPUImagePixellatePositionFilter alloc] init];
            [(GPUImagePixellatePositionFilter*)pFilter setRadius:val];
            }
            case GPUIMAGE_POLKADOT:
            {
            //            val = 0.05;
            pFilter = [[GPUImagePolkaDotFilter alloc] init];
            [(GPUImagePolkaDotFilter*)pFilter setFractionalWidthOfAPixel:val];
            }
            case GPUIMAGE_HALFTONE:
            {
            //            val = 0.01;
            pFilter = [[GPUImageHalftoneFilter alloc] init];
            [(GPUImageHalftoneFilter*)pFilter setFractionalWidthOfAPixel:val];
            }
            case GPUIMAGE_CROSSHATCH:
            {
            //            val = 0.01;
            pFilter = [[GPUImageCrosshatchFilter alloc] init];
            [(GPUImageCrosshatchFilter *)pFilter setCrossHatchSpacing:val];
            }
            case GPUIMAGE_COLORINVERT:
            {
            pFilter = [[GPUImageColorInvertFilter alloc] init];
            }
            case GPUIMAGE_GRAYSCALE:
            {
            pFilter = [[GPUImageGrayscaleFilter alloc] init];
            }
            case GPUIMAGE_MONOCHROME:
            {
            //            val = 1.0;
            pFilter = [[GPUImageMonochromeFilter alloc] init];
            [(GPUImageMonochromeFilter *)pFilter setColor:(GPUVector4){0.0f, 0.0f, 1.0f, 1.f}];
            [(GPUImageMonochromeFilter *)pFilter setIntensity:val];
            }
            case GPUIMAGE_FALSECOLOR:
            {
            pFilter = [[GPUImageFalseColorFilter alloc] init];
            }
            case GPUIMAGE_SOFTELEGANCE:
            {
            pFilter = (GPUImageFilter*)[[GPUImageSoftEleganceFilter alloc] init];
            }
            case GPUIMAGE_MISSETIKATE:
            {
            pFilter = (GPUImageFilter*)[[GPUImageMissEtikateFilter alloc] init];
            }
            case GPUIMAGE_AMATORKA:
            {
            pFilter = (GPUImageFilter*)[[GPUImageAmatorkaFilter alloc] init];
            }
            
            case GPUIMAGE_SATURATION:
            {
            //            val = 1.0;
            pFilter = [[GPUImageSaturationFilter alloc] init];
            [(GPUImageSaturationFilter *)pFilter setSaturation:val];
            
            }
            case GPUIMAGE_CONTRAST:
            {
            //            val = 1.0;
            pFilter = [[GPUImageContrastFilter alloc] init];
            [(GPUImageContrastFilter *)pFilter setContrast:val];
            
            }
            case GPUIMAGE_BRIGHTNESS:
            {
            //            val = 0.2;
            pFilter = [[GPUImageBrightnessFilter alloc] init];
            [(GPUImageBrightnessFilter *)pFilter setBrightness:val];
            
            }
            case GPUIMAGE_LEVELS:
            {
            //            val = 0.2;
            pFilter = [[GPUImageLevelsFilter alloc] init];
            [(GPUImageLevelsFilter *)pFilter setRedMin:val gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
            [(GPUImageLevelsFilter *)pFilter setGreenMin:val gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
            [(GPUImageLevelsFilter *)pFilter setBlueMin:val gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
            }
            case GPUIMAGE_RGB:
            {
            //            val = 1.0;
            pFilter = [[GPUImageRGBFilter alloc] init];
            [(GPUImageRGBFilter *)pFilter setRed:val];
            //            [(GPUImageRGBFilter *)pFilter setGreen:val];
            //            [(GPUImageRGBFilter *)pFilter setBlue:val];
            }
            case GPUIMAGE_HUE:
            {
            //            val = 90.0;
            pFilter = [[GPUImageHueFilter alloc] init];
            [(GPUImageHueFilter *)pFilter setHue:val];
            
            }
            case GPUIMAGE_WHITEBALANCE:
            {
            //            val = 5000.0;
            pFilter = [[GPUImageWhiteBalanceFilter alloc] init];
            [(GPUImageWhiteBalanceFilter *)pFilter setTemperature:val];
            
            }
            case GPUIMAGE_EXPOSURE:
            {
            //            val = 1.0;
            pFilter = [[GPUImageExposureFilter alloc] init];
            [(GPUImageExposureFilter *)pFilter setExposure:val];
            }
            case GPUIMAGE_SHARPEN:
            {
            //            val = 1.0;
            pFilter = [[GPUImageSharpenFilter alloc] init];
            [(GPUImageSharpenFilter *)pFilter setSharpness:val];
            
            }
            case GPUIMAGE_UNSHARPMASK:
            {
            //            val = 1.0;
            pFilter = (GPUImageFilter*)[[GPUImageUnsharpMaskFilter alloc] init];
            [(GPUImageUnsharpMaskFilter *)pFilter setIntensity:val];
            }
            case GPUIMAGE_GAMMA:
            {
            //            val = 1.0;
            pFilter = [[GPUImageGammaFilter alloc] init];
            [(GPUImageGammaFilter *)pFilter setGamma:val];
            
            }
            case GPUIMAGE_TONECURVE:
            {
            //            val = 0.5;
            Float32 valHi = 1.5 * val;
            pFilter = [[GPUImageToneCurveFilter alloc] init];
            [(GPUImageToneCurveFilter *)pFilter setRedControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, val)], [NSValue valueWithCGPoint:CGPointMake(1.0, valHi)], nil]];
            [(GPUImageToneCurveFilter *)pFilter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, val)], [NSValue valueWithCGPoint:CGPointMake(1.0, valHi)], nil]];
            [(GPUImageToneCurveFilter *)pFilter setGreenControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, val)], [NSValue valueWithCGPoint:CGPointMake(1.0, valHi)], nil]];
            
            }
            case GPUIMAGE_HIGHLIGHTSHADOW:
            {
            //            val = 1.0;
            pFilter = [[GPUImageHighlightShadowFilter alloc] init];
            [(GPUImageHighlightShadowFilter *)pFilter setHighlights:val];
            }
            case GPUIMAGE_HAZE:
            {
            //            val = 0.2;
            pFilter = [[GPUImageHazeFilter alloc] init];
            [(GPUImageHazeFilter *)pFilter setDistance:val];
            }
            case GPUIMAGE_AVERAGECOLOR:
            {
            pFilter = [[GPUImageAverageColor alloc] init];
            }
            case GPUIMAGE_LUMINOSITY:
            {
            pFilter = [[GPUImageLuminosity alloc] init];
            }
            case GPUIMAGE_HISTOGRAM:
            {
            //            val = 16.0;
            pFilter = [[GPUImageHistogramFilter alloc] initWithHistogramType:kGPUImageHistogramRGB];
            [(GPUImageHistogramFilter *)pFilter setDownsamplingFactor:round(val)];
            
            }
            case GPUIMAGE_HISTOGRAM_EQUALIZATION:
            {
            //            val = 16.0;
            pFilter = (GPUImageFilter*)[[GPUImageHistogramEqualizationFilter alloc] initWithHistogramType:kGPUImageHistogramLuminance];
            [(GPUImageHistogramEqualizationFilter *)pFilter setDownsamplingFactor:round(val)];
            
            }
            case GPUIMAGE_THRESHOLD:
            {
            //            val = 0.5;
            pFilter = [[GPUImageLuminanceThresholdFilter alloc] init];
            [(GPUImageLuminanceThresholdFilter *)pFilter setThreshold:val];
            
            }
            case GPUIMAGE_ADAPTIVETHRESHOLD:
            {
            //            val = 1.0;
            pFilter = (GPUImageFilter*)[[GPUImageAdaptiveThresholdFilter alloc] init];
            [(GPUImageAdaptiveThresholdFilter *)pFilter setBlurRadiusInPixels:val];
            
            }
            case GPUIMAGE_AVERAGELUMINANCETHRESHOLD:
            {
            //            val = 1.0;
            pFilter = (GPUImageFilter*)[[GPUImageAverageLuminanceThresholdFilter alloc] init];
            [(GPUImageAverageLuminanceThresholdFilter *)pFilter setThresholdMultiplier:val];
            
            }
            case GPUIMAGE_CROP:
            {
            //            val = 0.5;
            pFilter = [[GPUImageCropFilter alloc] initWithCropRegion:CGRectMake(0.0, 0.0, 1.0, val)];
            //            [(GPUImageCropFilter *)pFilter setCropRegion:CGRectMake(0.0, 0.0, 1.0, val)];
            }
            case GPUIMAGE_MASK:
            {
            pFilter = [[GPUImageMaskFilter alloc] init];
            
            [(GPUImageFilter*)pFilter setBackgroundColorRed:0.0 green:1.0 blue:0.0 alpha:1.0];
            
            }
            case GPUIMAGE_TRANSFORM:
            {
            //            val = 2.0;
            pFilter = [[GPUImageTransformFilter alloc] init];
            [(GPUImageTransformFilter *)pFilter setAffineTransform:CGAffineTransformMakeRotation(2.0)];
            //            [(GPUImageTransformFilter *)pFilter setIgnoreAspectRatio:YES];
            }
            case GPUIMAGE_TRANSFORM3D:
            {
            //            val = 0.75;
            pFilter = [[GPUImageTransformFilter alloc] init];
            CATransform3D perspectiveTransform = CATransform3DIdentity;
            perspectiveTransform.m34 = 0.4;
            perspectiveTransform.m33 = 0.4;
            perspectiveTransform = CATransform3DScale(perspectiveTransform,val, val, val);
            perspectiveTransform = CATransform3DRotate(perspectiveTransform, val, 0.0, 1.0, 0.0);
            
            [(GPUImageTransformFilter *)pFilter setTransform3D:perspectiveTransform];
            }
            case GPUIMAGE_SOBELEDGEDETECTION:
            {
            //            val = 0.25;
            pFilter = [[GPUImageSobelEdgeDetectionFilter alloc] init];
            [(GPUImageSobelEdgeDetectionFilter *)pFilter setEdgeStrength:val];
            
            }
            case GPUIMAGE_XYGRADIENT:
            {
            pFilter = [[GPUImageXYDerivativeFilter alloc] init];
            }
            case GPUIMAGE_HARRISCORNERDETECTION:
            {
            //            val = 0.2;
            pFilter = (GPUImageFilter*)[[GPUImageHarrisCornerDetectionFilter alloc] init];
            [(GPUImageHarrisCornerDetectionFilter *)pFilter setThreshold:val];
            }
            case GPUIMAGE_NOBLECORNERDETECTION:
            {
            //            val = 0.2;
            pFilter = (GPUImageFilter*)[[GPUImageNobleCornerDetectionFilter alloc] init];
            [(GPUImageNobleCornerDetectionFilter *)pFilter setThreshold:val];
            }
            case GPUIMAGE_SHITOMASIFEATUREDETECTION:
            {
            //            val = 0.2;
            pFilter = (GPUImageFilter*)[[GPUImageShiTomasiFeatureDetectionFilter alloc] init];
            [(GPUImageShiTomasiFeatureDetectionFilter *)pFilter setThreshold:val];
            }
            case GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR:
            {
            //            val = 0.6;
            pFilter = (GPUImageFilter*)[[GPUImageHoughTransformLineDetector alloc] init];
            [(GPUImageHoughTransformLineDetector *)pFilter setLineDetectionThreshold:val];
            }
            
            case GPUIMAGE_PREWITTEDGEDETECTION:
            {
            //            val = 1.0;
            pFilter = [[GPUImagePrewittEdgeDetectionFilter alloc] init];
            [(GPUImagePrewittEdgeDetectionFilter *)pFilter setEdgeStrength:val];
            
            }
            case GPUIMAGE_CANNYEDGEDETECTION:
            {
            //            val = 1.0;
            pFilter = (GPUImageFilter*)[[GPUImageCannyEdgeDetectionFilter alloc] init];
            [(GPUImageCannyEdgeDetectionFilter *)pFilter setBlurTexelSpacingMultiplier:val];
            
            }
            case GPUIMAGE_THRESHOLDEDGEDETECTION:
            {
            //            val = 0.25;
            pFilter = [[GPUImageThresholdEdgeDetectionFilter alloc] init];
            [(GPUImageThresholdEdgeDetectionFilter *)pFilter setThreshold:val];
            
            }
            case GPUIMAGE_LOCALBINARYPATTERN:
            {
            //            val = 1.0;
            pFilter = [[GPUImageLocalBinaryPatternFilter alloc] init];
            CGFloat multiplier = val;
            [(GPUImageLocalBinaryPatternFilter *)pFilter setTexelWidth:(multiplier / self.view.bounds.size.width)];
            [(GPUImageLocalBinaryPatternFilter *)pFilter setTexelHeight:(multiplier / self.view.bounds.size.height)];
            }
            case GPUIMAGE_BUFFER:
            {
            pFilter = [[GPUImageBuffer alloc] init];
            }
            case GPUIMAGE_LOWPASS:
            {
            //            val = 0.5;
            pFilter = (GPUImageFilter*)[[GPUImageLowPassFilter alloc] init];
            [(GPUImageLowPassFilter *)pFilter setFilterStrength:val];
            
            }
            case GPUIMAGE_HIGHPASS:
            {
            //            val = 0.5;
            pFilter = (GPUImageFilter*)[[GPUImageHighPassFilter alloc] init];
            [(GPUImageHighPassFilter *)pFilter setFilterStrength:val];
            
            }
            case GPUIMAGE_MOTIONDETECTOR:
            {
            //            val = 0.5;
            pFilter = (GPUImageFilter*)[[GPUImageMotionDetector alloc] init];
            [(GPUImageMotionDetector *)pFilter setLowPassFilterStrength:val];
            
            }
            case GPUIMAGE_SKETCH:
            {
            //            val = 0.25;
            pFilter = [[GPUImageSketchFilter alloc] init];
            [(GPUImageSketchFilter *)pFilter setEdgeStrength:val];
            
            }
            case GPUIMAGE_THRESHOLDSKETCH:
            {
            //            val = 0.25;
            pFilter = [[GPUImageThresholdSketchFilter alloc] init];
            [(GPUImageThresholdSketchFilter *)pFilter setThreshold:val];
            
            }
            case GPUIMAGE_TOON:
            {
            pFilter = [[GPUImageToonFilter alloc] init];
            }
            case GPUIMAGE_SMOOTHTOON:
            {
            //            val = 1.0;
            pFilter = (GPUImageFilter*)[[GPUImageSmoothToonFilter alloc] init];
            [(GPUImageSmoothToonFilter *)pFilter setBlurRadiusInPixels:val];
            
            }
            case GPUIMAGE_TILTSHIFT:
            {
            //            val = 0.5;
            pFilter = (GPUImageFilter*)[[GPUImageTiltShiftFilter alloc] init];
            [(GPUImageTiltShiftFilter *)pFilter setTopFocusLevel:val-0.1];
            [(GPUImageTiltShiftFilter *)pFilter setBottomFocusLevel:val+0.1];
            [(GPUImageTiltShiftFilter *)pFilter setFocusFallOffRate:0.2];
            }
            case GPUIMAGE_CGA:
            {
            pFilter = [[GPUImageCGAColorspaceFilter alloc] init];
            }
            case GPUIMAGE_CONVOLUTION:
            {
            pFilter = [[GPUImage3x3ConvolutionFilter alloc] init];
            //            [(GPUImage3x3ConvolutionFilter *)pFilter setConvolutionKernel:(GPUMatrix3x3){
            //                {-2.0f, -1.0f, 0.0f},
            //                {-1.0f,  1.0f, 1.0f},
            //                { 0.0f,  1.0f, 2.0f}
            //            }];
            [(GPUImage3x3ConvolutionFilter *)pFilter setConvolutionKernel:(GPUMatrix3x3){
            {-1.0f,  0.0f, 1.0f},
            {-2.0f, 0.0f, 2.0f},
            {-1.0f,  0.0f, 1.0f}
            }];
            
            //            [(GPUImage3x3ConvolutionFilter *)pFilter setConvolutionKernel:(GPUMatrix3x3){
            //                {1.0f,  1.0f, 1.0f},
            //                {1.0f, -8.0f, 1.0f},
            //                {1.0f,  1.0f, 1.0f}
            //            }];
            //            [(GPUImage3x3ConvolutionFilter *)pFilter setConvolutionKernel:(GPUMatrix3x3){
            //                { 0.11f,  0.11f, 0.11f},
            //                { 0.11f,  0.11f, 0.11f},
            //                { 0.11f,  0.11f, 0.11f}
            //            }];
            }
            case GPUIMAGE_EMBOSS:
            {
            //            val = 1.0;
            pFilter = [[GPUImageEmbossFilter alloc] init];
            [(GPUImageEmbossFilter *)pFilter setIntensity:val];
            
            }
            case GPUIMAGE_LAPLACIAN:
            {
            pFilter = [[GPUImageLaplacianFilter alloc] init];
            }
            case GPUIMAGE_POSTERIZE:
            {
            //            val = 10.0;
            pFilter = [[GPUImagePosterizeFilter alloc] init];
            [(GPUImagePosterizeFilter *)pFilter setColorLevels:round(val)];
            
            }
            case GPUIMAGE_SWIRL:
            {
            //            val = 1.0;
            pFilter = [[GPUImageSwirlFilter alloc] init];
            [(GPUImageSwirlFilter *)pFilter setAngle:val];
            
            }
            case GPUIMAGE_BULGE:
            {
            //            val = 0.5;
            pFilter = [[GPUImageBulgeDistortionFilter alloc] init];
            [(GPUImageBulgeDistortionFilter *)pFilter setScale:val];
            
            }
            case GPUIMAGE_SPHEREREFRACTION:
            {
            //            val = 0.15;
            pFilter = [[GPUImageSphereRefractionFilter alloc] init];
            [(GPUImageSphereRefractionFilter *)pFilter setRadius:val];
            }
            case GPUIMAGE_GLASSSPHERE:
            {
            //            val = 0.15;
            pFilter = [[GPUImageGlassSphereFilter alloc] init];
            [(GPUImageGlassSphereFilter *)pFilter setRadius:val];
            }
            case GPUIMAGE_PINCH:
            {
            //            val = 0.5;
            pFilter = [[GPUImagePinchDistortionFilter alloc] init];
            [(GPUImagePinchDistortionFilter *)pFilter setScale:val];
            
            }
            case GPUIMAGE_STRETCH:
            {
            pFilter = [[GPUImageStretchDistortionFilter alloc] init];
            }
            case GPUIMAGE_DILATION:
            {
            //            val = 4.0;
            pFilter = [[GPUImageRGBDilationFilter alloc] initWithRadius:val];
            }
            case GPUIMAGE_EROSION:
            {
            //            val = 4.0;
            pFilter = [[GPUImageRGBErosionFilter alloc] initWithRadius:val];
            }
            case GPUIMAGE_OPENING:
            {
            //            val = 4.0;
            pFilter = (GPUImageFilter*)[[GPUImageRGBOpeningFilter alloc] initWithRadius:val];
            
            }
            case GPUIMAGE_CLOSING:
            {
            //            val = 4.0;
            pFilter = (GPUImageFilter*)[[GPUImageRGBClosingFilter alloc] initWithRadius:val];
            }
            
            case GPUIMAGE_PERLINNOISE:
            {
            //            val = 8.0;
            pFilter = [[GPUImagePerlinNoiseFilter alloc] init];
            [(GPUImagePerlinNoiseFilter *)pFilter setScale:val];
            
            }
            case GPUIMAGE_VORONOI:
            {
            //            self.title = @"Voronoi";
            //            self.filterSettingsSlider.hidden = YES;
            //
            //            GPUImageJFAVoronoiFilter *jfa = [[GPUImageJFAVoronoiFilter alloc] init];
            //            [jfa setSizeInPixels:CGSizeMake(1024.0, 1024.0)];
            //
            //            sourcePicture = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"voroni_points2.png"]];
            //
            //            [sourcePicture addTarget:jfa];
            //
            //            pFilter = [[GPUImageVoronoiConsumerFilter alloc] init];
            //
            //            [jfa setSizeInPixels:CGSizeMake(1024.0, 1024.0)];
            //            [(GPUImageVoronoiConsumerFilter *)pFilter setSizeInPixels:CGSizeMake(1024.0, 1024.0)];
            //            [(*)pFilter :val];
            //
            //
            //            [videoCamera addTarget:filter];
            //            [jfa addTarget:filter];
            //            [sourcePicture processImage];
            NSException *exception = [NSException exceptionWithName:@"GPUIMAGE_VORNOI unsupported" reason:[NSString stringWithFormat:@"GPUIMAGE_VORNOI is unsupported"] userInfo:nil];
            @throw exception;
            return nil;
            }
            case GPUIMAGE_MOSAIC:
            {
            //            val = 0.025;
            pFilter = [[GPUImageMosaicFilter alloc] init];
            [(GPUImageMosaicFilter *)pFilter setDisplayTileSize:CGSizeMake(val,val)];
            
            [(GPUImageMosaicFilter *)pFilter setTileSet:@"squares.png"];
            [(GPUImageMosaicFilter *)pFilter setColorOn:NO];
            //[(GPUImageMosaicFilter *)pFilter setTileSet:@"dotletterstiles.png"];
            //[(GPUImageMosaicFilter *)pFilter setTileSet:@"curvies.png"];
            
            }
            case GPUIMAGE_CHROMAKEY:
            {
            //            val = 0.4;
            pFilter = [[GPUImageChromaKeyBlendFilter alloc] init];
            [(GPUImageChromaKeyBlendFilter *)pFilter setColorToReplaceRed:0.0 green:1.0 blue:0.0];
            [(GPUImageChromaKeyBlendFilter *)pFilter setThresholdSensitivity:val];
            
            }
            case GPUIMAGE_CHROMAKEYNONBLEND:
            {
            //            val = 0.4;
            pFilter = [[GPUImageChromaKeyFilter alloc] init];
            [(GPUImageChromaKeyFilter *)pFilter setColorToReplaceRed:0.0 green:1.0 blue:0.0];
            [(GPUImageChromaKeyFilter *)pFilter setThresholdSensitivity:val];
            
            }
            case GPUIMAGE_ADD:
            {
            pFilter = [[GPUImageAddBlendFilter alloc] init];
            }
            case GPUIMAGE_DIVIDE:
            {
            pFilter = [[GPUImageDivideBlendFilter alloc] init];
            }
            case GPUIMAGE_MULTIPLY:
            {
            pFilter = [[GPUImageMultiplyBlendFilter alloc] init];
            }
            case GPUIMAGE_OVERLAY:
            {
            pFilter = [[GPUImageOverlayBlendFilter alloc] init];
            }
            case GPUIMAGE_LIGHTEN:
            {
            pFilter = [[GPUImageLightenBlendFilter alloc] init];
            }
            case GPUIMAGE_DARKEN:
            {
            pFilter = [[GPUImageDarkenBlendFilter alloc] init];
            }
            case GPUIMAGE_DISSOLVE:
            {
            //            val = 0.5;
            pFilter = [[GPUImageDissolveBlendFilter alloc] init];
            [(GPUImageDissolveBlendFilter *)pFilter setMix:val];
            
            }
            case GPUIMAGE_SCREENBLEND:
            {
            pFilter = [[GPUImageScreenBlendFilter alloc] init];
            }
            case GPUIMAGE_COLORBURN:
            {
            pFilter = [[GPUImageColorBurnBlendFilter alloc] init];
            }
            case GPUIMAGE_COLORDODGE:
            {
            pFilter = [[GPUImageColorDodgeBlendFilter alloc] init];
            }
            case GPUIMAGE_LINEARBURN:
            {
            pFilter = [[GPUImageLinearBurnBlendFilter alloc] init];
            }
            case GPUIMAGE_EXCLUSIONBLEND:
            {
            pFilter = [[GPUImageExclusionBlendFilter alloc] init];
            }
            case GPUIMAGE_DIFFERENCEBLEND:
            {
            pFilter = [[GPUImageDifferenceBlendFilter alloc] init];
            }
            case GPUIMAGE_SUBTRACTBLEND:
            {
            pFilter = [[GPUImageSubtractBlendFilter alloc] init];
            }
            case GPUIMAGE_HARDLIGHTBLEND:
            {
            pFilter = [[GPUImageHardLightBlendFilter alloc] init];
            }
            case GPUIMAGE_SOFTLIGHTBLEND:
            {
            pFilter = [[GPUImageSoftLightBlendFilter alloc] init];
            }
            case GPUIMAGE_COLORBLEND:
            {
            pFilter = [[GPUImageColorBlendFilter alloc] init];
            }
            case GPUIMAGE_HUEBLEND:
            {
            pFilter = [[GPUImageHueBlendFilter alloc] init];
            }
            case GPUIMAGE_SATURATIONBLEND:
            {
            pFilter = [[GPUImageSaturationBlendFilter alloc] init];
            }
            case GPUIMAGE_LUMINOSITYBLEND:
            {
            pFilter = [[GPUImageLuminosityBlendFilter alloc] init];
            }
            case GPUIMAGE_NORMALBLEND:
            {
            pFilter = [[GPUImageNormalBlendFilter alloc] init];
            }
            case GPUIMAGE_POISSONBLEND:
            {
            //            val = 0.5;
            pFilter = [[GPUImagePoissonBlendFilter alloc] init];
            [(GPUImagePoissonBlendFilter *)pFilter setMix:val];
            
            }
            case GPUIMAGE_OPACITY:
            {
            //            val = 1.0;
            pFilter = [[GPUImageOpacityFilter alloc] init];
            [(GPUImageOpacityFilter *)pFilter setOpacity:val];
            
            }
            case GPUIMAGE_CUSTOM:
            {
            pFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomFilter"];
            //            pFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromString:<#(NSString *)#>sShader];
            }
            case GPUIMAGE_KUWAHARA:
            {
            //            val = 3.0;
            pFilter = [[GPUImageKuwaharaFilter alloc] init];
            [(GPUImageKuwaharaFilter *)pFilter setRadius:round(val)];
            
            }
            case GPUIMAGE_KUWAHARARADIUS3:
            {
            pFilter = [[GPUImageKuwaharaRadius3Filter alloc] init];
            }
            case GPUIMAGE_VIGNETTE:
            {
            //            val = 0.75;
            pFilter = [[GPUImageVignetteFilter alloc] init];
            [(GPUImageVignetteFilter *)pFilter setVignetteEnd:val];
            
            }
            case GPUIMAGE_GAUSSIAN:
            {
            //            val = 2.0;
            pFilter = [[GPUImageGaussianBlurFilter alloc] init];
            [(GPUImageGaussianBlurFilter *)pFilter setBlurRadiusInPixels:val];
            
            }
            case GPUIMAGE_BOXBLUR:
            {
            //            val = 2.0;
            pFilter = [[GPUImageBoxBlurFilter alloc] init];
            [(GPUImageBoxBlurFilter *)pFilter setBlurRadiusInPixels:val];
            
            }
            case GPUIMAGE_MEDIAN:
            {
            pFilter = [[GPUImageMedianFilter alloc] init];
            }
            case GPUIMAGE_MOTIONBLUR:
            {
            //            val = 0.0;
            pFilter = [[GPUImageMotionBlurFilter alloc] init];
            [(GPUImageMotionBlurFilter *)pFilter setBlurAngle:val];
            
            }
            case GPUIMAGE_ZOOMBLUR:
            {
            //            val = 1.0;
            pFilter = [[GPUImageZoomBlurFilter alloc] init];
            [(GPUImageZoomBlurFilter *)pFilter setBlurSize:val];
            
            }
            case GPUIMAGE_IOSBLUR:
            {
            pFilter = (GPUImageFilter*)[[GPUImageiOSBlurFilter alloc] init];
            }
            case GPUIMAGE_UIELEMENT:
            {
            pFilter = [[GPUImageSepiaFilter alloc] init];
            }
            case GPUIMAGE_GAUSSIAN_SELECTIVE:
            {
            //            val = 40.0/320.0;
            pFilter = (GPUImageFilter*)[[GPUImageGaussianSelectiveBlurFilter alloc] init];
            [(GPUImageGaussianSelectiveBlurFilter*)pFilter setExcludeCircleRadius:val];
            }
            case GPUIMAGE_GAUSSIAN_POSITION:
            {
            //            val = 40.0/320.0;
                pFilter = [[GPUImageGaussianBlurPositionFilter alloc] init];
                [(GPUImageGaussianBlurPositionFilter*)pFilter setBlurRadius:val];
            }
            case GPUIMAGE_BILATERAL:
            {
                //            val = 1.0;
                pFilter = [[GPUImageBilateralFilter alloc] init];
                [(GPUImageBilateralFilter *)pFilter setDistanceNormalizationFactor:val];
            
            }
            case GPUIMAGE_FILTERGROUP:
            {
            //            val = 0.05;
                pFilter = (GPUImageFilter*)[[GPUImageFilterGroup alloc] init];
                
                GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
                [(GPUImageSepiaFilter *)pFilter setIntensity:val];
                [(GPUImageFilterGroup *)pFilter addFilter:sepiaFilter];
                
                GPUImagePixellateFilter *pixellateFilter = [[GPUImagePixellateFilter alloc] init];
                [(GPUImagePixellateFilter *)pFilter setFractionalWidthOfAPixel:val];
                [(GPUImageFilterGroup *)pFilter addFilter:pixellateFilter];
                
                [sepiaFilter addTarget:pixellateFilter];
                [(GPUImageFilterGroup *)pFilter setInitialFilters:[NSArray arrayWithObject:sepiaFilter]];
                [(GPUImageFilterGroup *)pFilter setTerminalFilter:pixellateFilter];
            }
            
            case GPUIMAGE_FACES:
            {
                //            val = 1.0;
                pFilter = [[GPUImageSaturationFilter alloc] init];
                [(GPUImageSaturationFilter*)pFilter setSaturation:val];
            }
            */
            default: pFilter = [[GPUImageSepiaFilter alloc] init]
        }
        
        return pFilter;
    
    }
    
    func applyFilters()
    {
        var filter1: GPUImageFilter = [self _createFilter: (GPUImageShowcaseFilterType)GPUIMAGE_ZOOMBLUR val:(Float32)1.0];
//        GPUImageFilter *filter2 = [self _createFilter: (GPUImageShowcaseFilterType)GPUIMAGE_BULGE val:(Float32)0.5];
//
//        NSArray *aFilters = [NSArray arrayWithObjects:filter1, filter2, nil];
//        //    NSArray *aFilters = [NSArray arrayWithObjects:filter1, nil];
//        NSUInteger nFilters = [aFilters count];
//
//        GPUImageFilter *prevFilter = nil;
//
//        int i = 0;
//        for (GPUImageFilter* currentFilter in aFilters)
//        {
//            if (i == 0) {
//                [self->movieFile addTarget:currentFilter];
//            }
//
//            if (i != 0 && i != nFilters-1) {
//                [prevFilter addTarget:currentFilter];
//            }
//
//            if (i != nFilters-1) {
//                prevFilter = currentFilter;
//            }
//            i++;
//        }
//
//        self->filter = aFilters[nFilters-1];
//        if (i > 1) {
//            [prevFilter addTarget:self->filter];
//        }
    }
    

}

