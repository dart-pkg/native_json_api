import 'package:test/test.dart';
//import 'dart:ffi' as ffi;
import 'package:output/output.dart';
import 'package:native_json_api/native_json_api.dart';

void main() {
  group('Run', () {
    test('run1', () {
      try {
        int bitness = bitnessOfPointer;
        echo(bitness, r'bitness');
        //final $api = NativeJsonApi('PROGRAM.x$bitness.dll');
        //final $api = NativeJsonApi('C:/Users/user/.lt/cs-api/front/bin/release/net481/PROGRAM_native.dll');
        final $api = NativeJsonApi('PROGRAM.native.dll');
        dump($api.call$('add2', [11, 22]));
        dump($api.call('add2', 111, 222));
        dump($api.call$('add2', [11, 22, 33]));
      } catch (e, stacktrace) {
        dump('Exception: $e');
        //dump('Stacktrace: $stacktrace');
      }
    });
  });
}
