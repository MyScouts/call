class AudioConstants {
  static String outgoingCallRingtone = AudioResource.outgoingCallRingtone.path;
  static String incomingCallRingtone = AudioResource.incomingCallRingtone.path;
  static String reaction = AudioResource.reaction.path;
}

enum AudioResource {
  outgoingCallRingtone('assets/audio/outgoing_call_ringtone.mp3'),
  incomingCallRingtone('assets/audio/incoming_call_ringtone.mp3'),
  reaction('assets/audio/reaction.mp3'),
  ;

  const AudioResource(this.path);

  final String path;
}
