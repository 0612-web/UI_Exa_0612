import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Correct import for the app

// Helper classes to mock network requests for images
class MockHttpClient extends Fake implements HttpClient {
  @override
  bool autoUncompress = false;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    // Return a mock request for any URL
    return MockHttpClientRequest();
  }
}

class MockHttpClientRequest extends Fake implements HttpClientRequest {
  @override
  final HttpHeaders headers = MockHttpHeaders();

  @override
  Future<HttpClientResponse> close() async {
    // Return a mock response
    return MockHttpClientResponse();
  }
}

class MockHttpClientResponse extends Fake implements HttpClientResponse {
  @override
  int get statusCode => HttpStatus.ok;

  @override
  int get contentLength => _transparentImage.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    // Return a stream with a transparent image
    return Stream.fromIterable([_transparentImage]).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}

class MockHttpHeaders extends Fake implements HttpHeaders {}

// A 1x1 transparent PNG image
final _transparentImage = Uint8List.fromList([
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
  0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
  0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
  0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
  0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82
]);

void main() {
  testWidgets('Inicio screen UI elements are present', (WidgetTester tester) async {
    // Use HttpOverrides to mock image network requests
    await HttpOverrides.runZoned(
      () async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const DisenosApp());

        // Verify that the AppBar title is displayed.
        expect(find.text('FASHION EDITOR'), findsOneWidget);

        // Verify that the identification text is present.
        expect(find.text('Vania Jimenez Sanchez 6to gpo i #0612'), findsOneWidget);

        // Verify that the main "FASHION COLLECTION" text is displayed.
        expect(find.text('FASHION'), findsOneWidget);
        expect(find.text('COLLECTION'), findsOneWidget);
        expect(find.text('VANIA JIMENEZ'), findsOneWidget);

        // Verify that the button text is displayed.
        expect(find.text('EXPLORAR CATÁLOGO >'), findsOneWidget);

        // Verify that images are being rendered (we expect 2 network images).
        expect(find.byType(Image), findsNWidgets(2));
        
        // Verify the custom painter is present
        expect(find.byType(CustomPaint), findsOneWidget);

      },
      createHttpClient: (_) => MockHttpClient(),
    );
  });
}
