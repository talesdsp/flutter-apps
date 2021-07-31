import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  CameraController _cameraController;
  var _isCameraReady = false;
  XFile imageFile;

  @override
  void initState() {
    super.initState();
    initCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // App state changed before we got the chance to initialize.
    if (_cameraController == null || !_cameraController.value.isInitialized)
      return;

    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_cameraController != null) {
        // onNewCameraSelected(_cameraController.description);
      }
    }
  }

  Widget cameraWidget(
    context,
  ) {
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _cameraController.value.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: CameraPreview(_cameraController),
    );
  }

  Future<void> initCamera() async {
    var cameras = await availableCameras();
    _cameraController = CameraController(cameras.first, ResolutionPreset.high);
    await _cameraController.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Stack(
                children: [
                  cameraWidget(
                    context,
                  ),
                ],
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
