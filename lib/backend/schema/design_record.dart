import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'design_record.g.dart';

abstract class DesignRecord
    implements Built<DesignRecord, DesignRecordBuilder> {
  static Serializer<DesignRecord> get serializer => _$designRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'Comment')
  String get comment;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference> get likedBy;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DesignRecordBuilder builder) => builder
    ..photoUrl = ''
    ..comment = ''
    ..likedBy = ListBuilder()
    ..email = ''
    ..displayName = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Design');

  static Stream<DesignRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DesignRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DesignRecord._();
  factory DesignRecord([void Function(DesignRecordBuilder) updates]) =
      _$DesignRecord;

  static DesignRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDesignRecordData({
  DocumentReference user,
  String photoUrl,
  String comment,
  DateTime createdAt,
  String email,
  String displayName,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        DesignRecord.serializer,
        DesignRecord((d) => d
          ..user = user
          ..photoUrl = photoUrl
          ..comment = comment
          ..createdAt = createdAt
          ..likedBy = null
          ..email = email
          ..displayName = displayName
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
