// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_share_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PostTable extends DataClass implements Insertable<PostTable> {
  final int id;
  final int userId;
  final String desc;
  final String photo;
  final String createdAt;
  final String updatedAt;
  final int commentsCount;
  final int likesCount;
  final bool selfLike;
  final String user;
  final String comments;
  final String likes;
  PostTable(
      {@required this.id,
      @required this.userId,
      @required this.desc,
      @required this.photo,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.commentsCount,
      @required this.likesCount,
      @required this.selfLike,
      @required this.user,
      @required this.comments,
      @required this.likes});
  factory PostTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return PostTable(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      desc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}desc']),
      photo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}photo']),
      createdAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      commentsCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}comments_count']),
      likesCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}likes_count']),
      selfLike:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}self_like']),
      user: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
      comments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}comments']),
      likes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}likes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || commentsCount != null) {
      map['comments_count'] = Variable<int>(commentsCount);
    }
    if (!nullToAbsent || likesCount != null) {
      map['likes_count'] = Variable<int>(likesCount);
    }
    if (!nullToAbsent || selfLike != null) {
      map['self_like'] = Variable<bool>(selfLike);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<String>(comments);
    }
    if (!nullToAbsent || likes != null) {
      map['likes'] = Variable<String>(likes);
    }
    return map;
  }

  PostsTableCompanion toCompanion(bool nullToAbsent) {
    return PostsTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      commentsCount: commentsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(commentsCount),
      likesCount: likesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(likesCount),
      selfLike: selfLike == null && nullToAbsent
          ? const Value.absent()
          : Value(selfLike),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      likes:
          likes == null && nullToAbsent ? const Value.absent() : Value(likes),
    );
  }

  factory PostTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PostTable(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      desc: serializer.fromJson<String>(json['desc']),
      photo: serializer.fromJson<String>(json['photo']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      commentsCount: serializer.fromJson<int>(json['commentsCount']),
      likesCount: serializer.fromJson<int>(json['likesCount']),
      selfLike: serializer.fromJson<bool>(json['selfLike']),
      user: serializer.fromJson<String>(json['user']),
      comments: serializer.fromJson<String>(json['comments']),
      likes: serializer.fromJson<String>(json['likes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'desc': serializer.toJson<String>(desc),
      'photo': serializer.toJson<String>(photo),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'commentsCount': serializer.toJson<int>(commentsCount),
      'likesCount': serializer.toJson<int>(likesCount),
      'selfLike': serializer.toJson<bool>(selfLike),
      'user': serializer.toJson<String>(user),
      'comments': serializer.toJson<String>(comments),
      'likes': serializer.toJson<String>(likes),
    };
  }

  PostTable copyWith(
          {int id,
          int userId,
          String desc,
          String photo,
          String createdAt,
          String updatedAt,
          int commentsCount,
          int likesCount,
          bool selfLike,
          String user,
          String comments,
          String likes}) =>
      PostTable(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        desc: desc ?? this.desc,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentsCount: commentsCount ?? this.commentsCount,
        likesCount: likesCount ?? this.likesCount,
        selfLike: selfLike ?? this.selfLike,
        user: user ?? this.user,
        comments: comments ?? this.comments,
        likes: likes ?? this.likes,
      );
  @override
  String toString() {
    return (StringBuffer('PostTable(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('desc: $desc, ')
          ..write('photo: $photo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('likesCount: $likesCount, ')
          ..write('selfLike: $selfLike, ')
          ..write('user: $user, ')
          ..write('comments: $comments, ')
          ..write('likes: $likes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              desc.hashCode,
              $mrjc(
                  photo.hashCode,
                  $mrjc(
                      createdAt.hashCode,
                      $mrjc(
                          updatedAt.hashCode,
                          $mrjc(
                              commentsCount.hashCode,
                              $mrjc(
                                  likesCount.hashCode,
                                  $mrjc(
                                      selfLike.hashCode,
                                      $mrjc(
                                          user.hashCode,
                                          $mrjc(comments.hashCode,
                                              likes.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PostTable &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.desc == this.desc &&
          other.photo == this.photo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.commentsCount == this.commentsCount &&
          other.likesCount == this.likesCount &&
          other.selfLike == this.selfLike &&
          other.user == this.user &&
          other.comments == this.comments &&
          other.likes == this.likes);
}

class PostsTableCompanion extends UpdateCompanion<PostTable> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> desc;
  final Value<String> photo;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> commentsCount;
  final Value<int> likesCount;
  final Value<bool> selfLike;
  final Value<String> user;
  final Value<String> comments;
  final Value<String> likes;
  const PostsTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.desc = const Value.absent(),
    this.photo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.commentsCount = const Value.absent(),
    this.likesCount = const Value.absent(),
    this.selfLike = const Value.absent(),
    this.user = const Value.absent(),
    this.comments = const Value.absent(),
    this.likes = const Value.absent(),
  });
  PostsTableCompanion.insert({
    this.id = const Value.absent(),
    @required int userId,
    @required String desc,
    this.photo = const Value.absent(),
    @required String createdAt,
    @required String updatedAt,
    @required int commentsCount,
    @required int likesCount,
    @required bool selfLike,
    @required String user,
    @required String comments,
    @required String likes,
  })  : userId = Value(userId),
        desc = Value(desc),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        commentsCount = Value(commentsCount),
        likesCount = Value(likesCount),
        selfLike = Value(selfLike),
        user = Value(user),
        comments = Value(comments),
        likes = Value(likes);
  static Insertable<PostTable> custom({
    Expression<int> id,
    Expression<int> userId,
    Expression<String> desc,
    Expression<String> photo,
    Expression<String> createdAt,
    Expression<String> updatedAt,
    Expression<int> commentsCount,
    Expression<int> likesCount,
    Expression<bool> selfLike,
    Expression<String> user,
    Expression<String> comments,
    Expression<String> likes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (desc != null) 'desc': desc,
      if (photo != null) 'photo': photo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (commentsCount != null) 'comments_count': commentsCount,
      if (likesCount != null) 'likes_count': likesCount,
      if (selfLike != null) 'self_like': selfLike,
      if (user != null) 'user': user,
      if (comments != null) 'comments': comments,
      if (likes != null) 'likes': likes,
    });
  }

  PostsTableCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<String> desc,
      Value<String> photo,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> commentsCount,
      Value<int> likesCount,
      Value<bool> selfLike,
      Value<String> user,
      Value<String> comments,
      Value<String> likes}) {
    return PostsTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      desc: desc ?? this.desc,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      commentsCount: commentsCount ?? this.commentsCount,
      likesCount: likesCount ?? this.likesCount,
      selfLike: selfLike ?? this.selfLike,
      user: user ?? this.user,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (commentsCount.present) {
      map['comments_count'] = Variable<int>(commentsCount.value);
    }
    if (likesCount.present) {
      map['likes_count'] = Variable<int>(likesCount.value);
    }
    if (selfLike.present) {
      map['self_like'] = Variable<bool>(selfLike.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    if (comments.present) {
      map['comments'] = Variable<String>(comments.value);
    }
    if (likes.present) {
      map['likes'] = Variable<String>(likes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostsTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('desc: $desc, ')
          ..write('photo: $photo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('commentsCount: $commentsCount, ')
          ..write('likesCount: $likesCount, ')
          ..write('selfLike: $selfLike, ')
          ..write('user: $user, ')
          ..write('comments: $comments, ')
          ..write('likes: $likes')
          ..write(')'))
        .toString();
  }
}

class $PostsTableTable extends PostsTable
    with TableInfo<$PostsTableTable, PostTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $PostsTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  GeneratedTextColumn _desc;
  @override
  GeneratedTextColumn get desc => _desc ??= _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  GeneratedTextColumn _photo;
  @override
  GeneratedTextColumn get photo => _photo ??= _constructPhoto();
  GeneratedTextColumn _constructPhoto() {
    return GeneratedTextColumn('photo', $tableName, false,
        defaultValue: Constant(""));
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedTextColumn _createdAt;
  @override
  GeneratedTextColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedTextColumn _constructCreatedAt() {
    return GeneratedTextColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedTextColumn _updatedAt;
  @override
  GeneratedTextColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedTextColumn _constructUpdatedAt() {
    return GeneratedTextColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsCountMeta =
      const VerificationMeta('commentsCount');
  GeneratedIntColumn _commentsCount;
  @override
  GeneratedIntColumn get commentsCount =>
      _commentsCount ??= _constructCommentsCount();
  GeneratedIntColumn _constructCommentsCount() {
    return GeneratedIntColumn(
      'comments_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likesCountMeta = const VerificationMeta('likesCount');
  GeneratedIntColumn _likesCount;
  @override
  GeneratedIntColumn get likesCount => _likesCount ??= _constructLikesCount();
  GeneratedIntColumn _constructLikesCount() {
    return GeneratedIntColumn(
      'likes_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _selfLikeMeta = const VerificationMeta('selfLike');
  GeneratedBoolColumn _selfLike;
  @override
  GeneratedBoolColumn get selfLike => _selfLike ??= _constructSelfLike();
  GeneratedBoolColumn _constructSelfLike() {
    return GeneratedBoolColumn(
      'self_like',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedTextColumn _user;
  @override
  GeneratedTextColumn get user => _user ??= _constructUser();
  GeneratedTextColumn _constructUser() {
    return GeneratedTextColumn(
      'user',
      $tableName,
      false,
    );
  }

  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  GeneratedTextColumn _comments;
  @override
  GeneratedTextColumn get comments => _comments ??= _constructComments();
  GeneratedTextColumn _constructComments() {
    return GeneratedTextColumn(
      'comments',
      $tableName,
      false,
    );
  }

  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  GeneratedTextColumn _likes;
  @override
  GeneratedTextColumn get likes => _likes ??= _constructLikes();
  GeneratedTextColumn _constructLikes() {
    return GeneratedTextColumn(
      'likes',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        desc,
        photo,
        createdAt,
        updatedAt,
        commentsCount,
        likesCount,
        selfLike,
        user,
        comments,
        likes
      ];
  @override
  $PostsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'posts_table';
  @override
  final String actualTableName = 'posts_table';
  @override
  VerificationContext validateIntegrity(Insertable<PostTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc'], _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo'], _photoMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('comments_count')) {
      context.handle(
          _commentsCountMeta,
          commentsCount.isAcceptableOrUnknown(
              data['comments_count'], _commentsCountMeta));
    } else if (isInserting) {
      context.missing(_commentsCountMeta);
    }
    if (data.containsKey('likes_count')) {
      context.handle(
          _likesCountMeta,
          likesCount.isAcceptableOrUnknown(
              data['likes_count'], _likesCountMeta));
    } else if (isInserting) {
      context.missing(_likesCountMeta);
    }
    if (data.containsKey('self_like')) {
      context.handle(_selfLikeMeta,
          selfLike.isAcceptableOrUnknown(data['self_like'], _selfLikeMeta));
    } else if (isInserting) {
      context.missing(_selfLikeMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user'], _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments'], _commentsMeta));
    } else if (isInserting) {
      context.missing(_commentsMeta);
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes'], _likesMeta));
    } else if (isInserting) {
      context.missing(_likesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PostTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PostsTableTable createAlias(String alias) {
    return $PostsTableTable(_db, alias);
  }
}

class MyPost extends DataClass implements Insertable<MyPost> {
  final String post;
  final String user;
  MyPost({@required this.post, @required this.user});
  factory MyPost.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return MyPost(
      post: stringType.mapFromDatabaseResponse(data['${effectivePrefix}post']),
      user: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || post != null) {
      map['post'] = Variable<String>(post);
    }
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>(user);
    }
    return map;
  }

  MyPostTableCompanion toCompanion(bool nullToAbsent) {
    return MyPostTableCompanion(
      post: post == null && nullToAbsent ? const Value.absent() : Value(post),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  factory MyPost.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyPost(
      post: serializer.fromJson<String>(json['post']),
      user: serializer.fromJson<String>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'post': serializer.toJson<String>(post),
      'user': serializer.toJson<String>(user),
    };
  }

  MyPost copyWith({String post, String user}) => MyPost(
        post: post ?? this.post,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('MyPost(')
          ..write('post: $post, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(post.hashCode, user.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MyPost && other.post == this.post && other.user == this.user);
}

class MyPostTableCompanion extends UpdateCompanion<MyPost> {
  final Value<String> post;
  final Value<String> user;
  const MyPostTableCompanion({
    this.post = const Value.absent(),
    this.user = const Value.absent(),
  });
  MyPostTableCompanion.insert({
    @required String post,
    @required String user,
  })  : post = Value(post),
        user = Value(user);
  static Insertable<MyPost> custom({
    Expression<String> post,
    Expression<String> user,
  }) {
    return RawValuesInsertable({
      if (post != null) 'post': post,
      if (user != null) 'user': user,
    });
  }

  MyPostTableCompanion copyWith({Value<String> post, Value<String> user}) {
    return MyPostTableCompanion(
      post: post ?? this.post,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (post.present) {
      map['post'] = Variable<String>(post.value);
    }
    if (user.present) {
      map['user'] = Variable<String>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyPostTableCompanion(')
          ..write('post: $post, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $MyPostTableTable extends MyPostTable
    with TableInfo<$MyPostTableTable, MyPost> {
  final GeneratedDatabase _db;
  final String _alias;
  $MyPostTableTable(this._db, [this._alias]);
  final VerificationMeta _postMeta = const VerificationMeta('post');
  GeneratedTextColumn _post;
  @override
  GeneratedTextColumn get post => _post ??= _constructPost();
  GeneratedTextColumn _constructPost() {
    return GeneratedTextColumn(
      'post',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedTextColumn _user;
  @override
  GeneratedTextColumn get user => _user ??= _constructUser();
  GeneratedTextColumn _constructUser() {
    return GeneratedTextColumn(
      'user',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [post, user];
  @override
  $MyPostTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_post_table';
  @override
  final String actualTableName = 'my_post_table';
  @override
  VerificationContext validateIntegrity(Insertable<MyPost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('post')) {
      context.handle(
          _postMeta, post.isAcceptableOrUnknown(data['post'], _postMeta));
    } else if (isInserting) {
      context.missing(_postMeta);
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user'], _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {user};
  @override
  MyPost map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MyPost.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MyPostTableTable createAlias(String alias) {
    return $MyPostTableTable(_db, alias);
  }
}

abstract class _$SmartShareDatabase extends GeneratedDatabase {
  _$SmartShareDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $PostsTableTable _postsTable;
  $PostsTableTable get postsTable => _postsTable ??= $PostsTableTable(this);
  $MyPostTableTable _myPostTable;
  $MyPostTableTable get myPostTable => _myPostTable ??= $MyPostTableTable(this);
  PostDao _postDao;
  PostDao get postDao => _postDao ??= PostDao(this as SmartShareDatabase);
  MyPostDao _myPostDao;
  MyPostDao get myPostDao =>
      _myPostDao ??= MyPostDao(this as SmartShareDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [postsTable, myPostTable];
}
