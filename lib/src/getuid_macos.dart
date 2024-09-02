import 'dart:ffi';
import 'dart:io';

typedef _GetuidC = Int32 Function();
typedef _GetuidDart = int Function();

int getuid_macos() {
  if (!Platform.isMacOS) {
    throw 'Unable to determine UID on this system';
  }

  final dylib = DynamicLibrary.open('/usr/lib/libSystem.dylib');
  final getuidP = dylib.lookupFunction<_GetuidC, _GetuidDart>('getuid');

  return getuidP();
}
