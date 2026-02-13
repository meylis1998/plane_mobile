// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_database.dart';

// ignore_for_file: type=lint
class $WorkspacesTableTable extends WorkspacesTable
    with TableInfo<$WorkspacesTableTable, WorkspacesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkspacesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
    'logo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, slug, logo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workspaces_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkspacesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
        _logoMeta,
        logo.isAcceptableOrUnknown(data['logo']!, _logoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkspacesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkspacesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      logo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo'],
      ),
    );
  }

  @override
  $WorkspacesTableTable createAlias(String alias) {
    return $WorkspacesTableTable(attachedDatabase, alias);
  }
}

class WorkspacesTableData extends DataClass
    implements Insertable<WorkspacesTableData> {
  final String id;
  final String name;
  final String slug;
  final String? logo;
  const WorkspacesTableData({
    required this.id,
    required this.name,
    required this.slug,
    this.logo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['slug'] = Variable<String>(slug);
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    return map;
  }

  WorkspacesTableCompanion toCompanion(bool nullToAbsent) {
    return WorkspacesTableCompanion(
      id: Value(id),
      name: Value(name),
      slug: Value(slug),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
    );
  }

  factory WorkspacesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkspacesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      slug: serializer.fromJson<String>(json['slug']),
      logo: serializer.fromJson<String?>(json['logo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'slug': serializer.toJson<String>(slug),
      'logo': serializer.toJson<String?>(logo),
    };
  }

  WorkspacesTableData copyWith({
    String? id,
    String? name,
    String? slug,
    Value<String?> logo = const Value.absent(),
  }) => WorkspacesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    logo: logo.present ? logo.value : this.logo,
  );
  WorkspacesTableData copyWithCompanion(WorkspacesTableCompanion data) {
    return WorkspacesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      slug: data.slug.present ? data.slug.value : this.slug,
      logo: data.logo.present ? data.logo.value : this.logo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkspacesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('logo: $logo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, slug, logo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkspacesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.slug == this.slug &&
          other.logo == this.logo);
}

class WorkspacesTableCompanion extends UpdateCompanion<WorkspacesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> slug;
  final Value<String?> logo;
  final Value<int> rowid;
  const WorkspacesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.slug = const Value.absent(),
    this.logo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkspacesTableCompanion.insert({
    required String id,
    required String name,
    required String slug,
    this.logo = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       slug = Value(slug);
  static Insertable<WorkspacesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? slug,
    Expression<String>? logo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (logo != null) 'logo': logo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkspacesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? slug,
    Value<String?>? logo,
    Value<int>? rowid,
  }) {
    return WorkspacesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      logo: logo ?? this.logo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkspacesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('logo: $logo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MembersTableTable extends MembersTable
    with TableInfo<$MembersTableTable, MembersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<int> role = GeneratedColumn<int>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workspaceId,
    userId,
    role,
    email,
    displayName,
    avatar,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MembersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MembersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MembersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
    );
  }

  @override
  $MembersTableTable createAlias(String alias) {
    return $MembersTableTable(attachedDatabase, alias);
  }
}

class MembersTableData extends DataClass
    implements Insertable<MembersTableData> {
  final String id;
  final String workspaceId;
  final String userId;
  final int role;
  final String? email;
  final String? displayName;
  final String? avatar;
  const MembersTableData({
    required this.id,
    required this.workspaceId,
    required this.userId,
    required this.role,
    this.email,
    this.displayName,
    this.avatar,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workspace_id'] = Variable<String>(workspaceId);
    map['user_id'] = Variable<String>(userId);
    map['role'] = Variable<int>(role);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    return map;
  }

  MembersTableCompanion toCompanion(bool nullToAbsent) {
    return MembersTableCompanion(
      id: Value(id),
      workspaceId: Value(workspaceId),
      userId: Value(userId),
      role: Value(role),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
    );
  }

  factory MembersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MembersTableData(
      id: serializer.fromJson<String>(json['id']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      userId: serializer.fromJson<String>(json['userId']),
      role: serializer.fromJson<int>(json['role']),
      email: serializer.fromJson<String?>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      avatar: serializer.fromJson<String?>(json['avatar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'userId': serializer.toJson<String>(userId),
      'role': serializer.toJson<int>(role),
      'email': serializer.toJson<String?>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'avatar': serializer.toJson<String?>(avatar),
    };
  }

  MembersTableData copyWith({
    String? id,
    String? workspaceId,
    String? userId,
    int? role,
    Value<String?> email = const Value.absent(),
    Value<String?> displayName = const Value.absent(),
    Value<String?> avatar = const Value.absent(),
  }) => MembersTableData(
    id: id ?? this.id,
    workspaceId: workspaceId ?? this.workspaceId,
    userId: userId ?? this.userId,
    role: role ?? this.role,
    email: email.present ? email.value : this.email,
    displayName: displayName.present ? displayName.value : this.displayName,
    avatar: avatar.present ? avatar.value : this.avatar,
  );
  MembersTableData copyWithCompanion(MembersTableCompanion data) {
    return MembersTableData(
      id: data.id.present ? data.id.value : this.id,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
      userId: data.userId.present ? data.userId.value : this.userId,
      role: data.role.present ? data.role.value : this.role,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MembersTableData(')
          ..write('id: $id, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, workspaceId, userId, role, email, displayName, avatar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MembersTableData &&
          other.id == this.id &&
          other.workspaceId == this.workspaceId &&
          other.userId == this.userId &&
          other.role == this.role &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.avatar == this.avatar);
}

class MembersTableCompanion extends UpdateCompanion<MembersTableData> {
  final Value<String> id;
  final Value<String> workspaceId;
  final Value<String> userId;
  final Value<int> role;
  final Value<String?> email;
  final Value<String?> displayName;
  final Value<String?> avatar;
  final Value<int> rowid;
  const MembersTableCompanion({
    this.id = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.userId = const Value.absent(),
    this.role = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MembersTableCompanion.insert({
    required String id,
    required String workspaceId,
    required String userId,
    required int role,
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workspaceId = Value(workspaceId),
       userId = Value(userId),
       role = Value(role);
  static Insertable<MembersTableData> custom({
    Expression<String>? id,
    Expression<String>? workspaceId,
    Expression<String>? userId,
    Expression<int>? role,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? avatar,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (userId != null) 'user_id': userId,
      if (role != null) 'role': role,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (avatar != null) 'avatar': avatar,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MembersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? workspaceId,
    Value<String>? userId,
    Value<int>? role,
    Value<String?>? email,
    Value<String?>? displayName,
    Value<String?>? avatar,
    Value<int>? rowid,
  }) {
    return MembersTableCompanion(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      avatar: avatar ?? this.avatar,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(role.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersTableCompanion(')
          ..write('id: $id, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('userId: $userId, ')
          ..write('role: $role, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('avatar: $avatar, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTableTable extends ProjectsTable
    with TableInfo<$ProjectsTableTable, ProjectsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _identifierMeta = const VerificationMeta(
    'identifier',
  );
  @override
  late final GeneratedColumn<String> identifier = GeneratedColumn<String>(
    'identifier',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverImageMeta = const VerificationMeta(
    'coverImage',
  );
  @override
  late final GeneratedColumn<String> coverImage = GeneratedColumn<String>(
    'cover_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _networkMeta = const VerificationMeta(
    'network',
  );
  @override
  late final GeneratedColumn<int> network = GeneratedColumn<int>(
    'network',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workspaceId,
    name,
    description,
    identifier,
    emoji,
    coverImage,
    network,
    isArchived,
    isFavorite,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('identifier')) {
      context.handle(
        _identifierMeta,
        identifier.isAcceptableOrUnknown(data['identifier']!, _identifierMeta),
      );
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    }
    if (data.containsKey('cover_image')) {
      context.handle(
        _coverImageMeta,
        coverImage.isAcceptableOrUnknown(data['cover_image']!, _coverImageMeta),
      );
    }
    if (data.containsKey('network')) {
      context.handle(
        _networkMeta,
        network.isAcceptableOrUnknown(data['network']!, _networkMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      identifier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identifier'],
      ),
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      ),
      coverImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image'],
      ),
      network: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}network'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ProjectsTableTable createAlias(String alias) {
    return $ProjectsTableTable(attachedDatabase, alias);
  }
}

class ProjectsTableData extends DataClass
    implements Insertable<ProjectsTableData> {
  final String id;
  final String workspaceId;
  final String name;
  final String? description;
  final String? identifier;
  final String? emoji;
  final String? coverImage;
  final int network;
  final bool isArchived;
  final bool isFavorite;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const ProjectsTableData({
    required this.id,
    required this.workspaceId,
    required this.name,
    this.description,
    this.identifier,
    this.emoji,
    this.coverImage,
    required this.network,
    required this.isArchived,
    required this.isFavorite,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['workspace_id'] = Variable<String>(workspaceId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || identifier != null) {
      map['identifier'] = Variable<String>(identifier);
    }
    if (!nullToAbsent || emoji != null) {
      map['emoji'] = Variable<String>(emoji);
    }
    if (!nullToAbsent || coverImage != null) {
      map['cover_image'] = Variable<String>(coverImage);
    }
    map['network'] = Variable<int>(network);
    map['is_archived'] = Variable<bool>(isArchived);
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProjectsTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectsTableCompanion(
      id: Value(id),
      workspaceId: Value(workspaceId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      identifier: identifier == null && nullToAbsent
          ? const Value.absent()
          : Value(identifier),
      emoji: emoji == null && nullToAbsent
          ? const Value.absent()
          : Value(emoji),
      coverImage: coverImage == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImage),
      network: Value(network),
      isArchived: Value(isArchived),
      isFavorite: Value(isFavorite),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ProjectsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectsTableData(
      id: serializer.fromJson<String>(json['id']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      identifier: serializer.fromJson<String?>(json['identifier']),
      emoji: serializer.fromJson<String?>(json['emoji']),
      coverImage: serializer.fromJson<String?>(json['coverImage']),
      network: serializer.fromJson<int>(json['network']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'identifier': serializer.toJson<String?>(identifier),
      'emoji': serializer.toJson<String?>(emoji),
      'coverImage': serializer.toJson<String?>(coverImage),
      'network': serializer.toJson<int>(network),
      'isArchived': serializer.toJson<bool>(isArchived),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ProjectsTableData copyWith({
    String? id,
    String? workspaceId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> identifier = const Value.absent(),
    Value<String?> emoji = const Value.absent(),
    Value<String?> coverImage = const Value.absent(),
    int? network,
    bool? isArchived,
    bool? isFavorite,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => ProjectsTableData(
    id: id ?? this.id,
    workspaceId: workspaceId ?? this.workspaceId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    identifier: identifier.present ? identifier.value : this.identifier,
    emoji: emoji.present ? emoji.value : this.emoji,
    coverImage: coverImage.present ? coverImage.value : this.coverImage,
    network: network ?? this.network,
    isArchived: isArchived ?? this.isArchived,
    isFavorite: isFavorite ?? this.isFavorite,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ProjectsTableData copyWithCompanion(ProjectsTableCompanion data) {
    return ProjectsTableData(
      id: data.id.present ? data.id.value : this.id,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      identifier: data.identifier.present
          ? data.identifier.value
          : this.identifier,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      coverImage: data.coverImage.present
          ? data.coverImage.value
          : this.coverImage,
      network: data.network.present ? data.network.value : this.network,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableData(')
          ..write('id: $id, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('identifier: $identifier, ')
          ..write('emoji: $emoji, ')
          ..write('coverImage: $coverImage, ')
          ..write('network: $network, ')
          ..write('isArchived: $isArchived, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workspaceId,
    name,
    description,
    identifier,
    emoji,
    coverImage,
    network,
    isArchived,
    isFavorite,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectsTableData &&
          other.id == this.id &&
          other.workspaceId == this.workspaceId &&
          other.name == this.name &&
          other.description == this.description &&
          other.identifier == this.identifier &&
          other.emoji == this.emoji &&
          other.coverImage == this.coverImage &&
          other.network == this.network &&
          other.isArchived == this.isArchived &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsTableCompanion extends UpdateCompanion<ProjectsTableData> {
  final Value<String> id;
  final Value<String> workspaceId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> identifier;
  final Value<String?> emoji;
  final Value<String?> coverImage;
  final Value<int> network;
  final Value<bool> isArchived;
  final Value<bool> isFavorite;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ProjectsTableCompanion({
    this.id = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.identifier = const Value.absent(),
    this.emoji = const Value.absent(),
    this.coverImage = const Value.absent(),
    this.network = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsTableCompanion.insert({
    required String id,
    required String workspaceId,
    required String name,
    this.description = const Value.absent(),
    this.identifier = const Value.absent(),
    this.emoji = const Value.absent(),
    this.coverImage = const Value.absent(),
    this.network = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workspaceId = Value(workspaceId),
       name = Value(name);
  static Insertable<ProjectsTableData> custom({
    Expression<String>? id,
    Expression<String>? workspaceId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? identifier,
    Expression<String>? emoji,
    Expression<String>? coverImage,
    Expression<int>? network,
    Expression<bool>? isArchived,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (identifier != null) 'identifier': identifier,
      if (emoji != null) 'emoji': emoji,
      if (coverImage != null) 'cover_image': coverImage,
      if (network != null) 'network': network,
      if (isArchived != null) 'is_archived': isArchived,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? workspaceId,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? identifier,
    Value<String?>? emoji,
    Value<String?>? coverImage,
    Value<int>? network,
    Value<bool>? isArchived,
    Value<bool>? isFavorite,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProjectsTableCompanion(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      name: name ?? this.name,
      description: description ?? this.description,
      identifier: identifier ?? this.identifier,
      emoji: emoji ?? this.emoji,
      coverImage: coverImage ?? this.coverImage,
      network: network ?? this.network,
      isArchived: isArchived ?? this.isArchived,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (identifier.present) {
      map['identifier'] = Variable<String>(identifier.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (coverImage.present) {
      map['cover_image'] = Variable<String>(coverImage.value);
    }
    if (network.present) {
      map['network'] = Variable<int>(network.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsTableCompanion(')
          ..write('id: $id, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('identifier: $identifier, ')
          ..write('emoji: $emoji, ')
          ..write('coverImage: $coverImage, ')
          ..write('network: $network, ')
          ..write('isArchived: $isArchived, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkItemsTableTable extends WorkItemsTable
    with TableInfo<$WorkItemsTableTable, WorkItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workspaceSlugMeta = const VerificationMeta(
    'workspaceSlug',
  );
  @override
  late final GeneratedColumn<String> workspaceSlug = GeneratedColumn<String>(
    'workspace_slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionHtmlMeta = const VerificationMeta(
    'descriptionHtml',
  );
  @override
  late final GeneratedColumn<String> descriptionHtml = GeneratedColumn<String>(
    'description_html',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateIdMeta = const VerificationMeta(
    'stateId',
  );
  @override
  late final GeneratedColumn<String> stateId = GeneratedColumn<String>(
    'state_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(4),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sequenceIdMeta = const VerificationMeta(
    'sequenceId',
  );
  @override
  late final GeneratedColumn<int> sequenceId = GeneratedColumn<int>(
    'sequence_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _assigneeIdsMeta = const VerificationMeta(
    'assigneeIds',
  );
  @override
  late final GeneratedColumn<String> assigneeIds = GeneratedColumn<String>(
    'assignee_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _labelIdsMeta = const VerificationMeta(
    'labelIds',
  );
  @override
  late final GeneratedColumn<String> labelIds = GeneratedColumn<String>(
    'label_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<String> cycleId = GeneratedColumn<String>(
    'cycle_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moduleIdMeta = const VerificationMeta(
    'moduleId',
  );
  @override
  late final GeneratedColumn<String> moduleId = GeneratedColumn<String>(
    'module_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimateMeta = const VerificationMeta(
    'estimate',
  );
  @override
  late final GeneratedColumn<int> estimate = GeneratedColumn<int>(
    'estimate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDirtyMeta = const VerificationMeta(
    'isDirty',
  );
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
    'is_dirty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_dirty" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _localVersionMeta = const VerificationMeta(
    'localVersion',
  );
  @override
  late final GeneratedColumn<int> localVersion = GeneratedColumn<int>(
    'local_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    workspaceSlug,
    name,
    description,
    descriptionHtml,
    stateId,
    priority,
    startDate,
    targetDate,
    parentId,
    sequenceId,
    sortOrder,
    assigneeIds,
    labelIds,
    cycleId,
    moduleId,
    createdById,
    createdAt,
    updatedAt,
    estimate,
    isDirty,
    localVersion,
    serverVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('workspace_slug')) {
      context.handle(
        _workspaceSlugMeta,
        workspaceSlug.isAcceptableOrUnknown(
          data['workspace_slug']!,
          _workspaceSlugMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceSlugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('description_html')) {
      context.handle(
        _descriptionHtmlMeta,
        descriptionHtml.isAcceptableOrUnknown(
          data['description_html']!,
          _descriptionHtmlMeta,
        ),
      );
    }
    if (data.containsKey('state_id')) {
      context.handle(
        _stateIdMeta,
        stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('sequence_id')) {
      context.handle(
        _sequenceIdMeta,
        sequenceId.isAcceptableOrUnknown(data['sequence_id']!, _sequenceIdMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('assignee_ids')) {
      context.handle(
        _assigneeIdsMeta,
        assigneeIds.isAcceptableOrUnknown(
          data['assignee_ids']!,
          _assigneeIdsMeta,
        ),
      );
    }
    if (data.containsKey('label_ids')) {
      context.handle(
        _labelIdsMeta,
        labelIds.isAcceptableOrUnknown(data['label_ids']!, _labelIdsMeta),
      );
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    }
    if (data.containsKey('module_id')) {
      context.handle(
        _moduleIdMeta,
        moduleId.isAcceptableOrUnknown(data['module_id']!, _moduleIdMeta),
      );
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('estimate')) {
      context.handle(
        _estimateMeta,
        estimate.isAcceptableOrUnknown(data['estimate']!, _estimateMeta),
      );
    }
    if (data.containsKey('is_dirty')) {
      context.handle(
        _isDirtyMeta,
        isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta),
      );
    }
    if (data.containsKey('local_version')) {
      context.handle(
        _localVersionMeta,
        localVersion.isAcceptableOrUnknown(
          data['local_version']!,
          _localVersionMeta,
        ),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      workspaceSlug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_slug'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      descriptionHtml: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_html'],
      ),
      stateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_id'],
      ),
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      sequenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence_id'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      assigneeIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assignee_ids'],
      )!,
      labelIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label_ids'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cycle_id'],
      ),
      moduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_id'],
      ),
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      estimate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimate'],
      ),
      isDirty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_dirty'],
      )!,
      localVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_version'],
      )!,
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      ),
    );
  }

  @override
  $WorkItemsTableTable createAlias(String alias) {
    return $WorkItemsTableTable(attachedDatabase, alias);
  }
}

class WorkItemsTableData extends DataClass
    implements Insertable<WorkItemsTableData> {
  final String id;
  final String projectId;
  final String workspaceSlug;
  final String name;
  final String? description;
  final String? descriptionHtml;
  final String? stateId;
  final int priority;
  final DateTime? startDate;
  final DateTime? targetDate;
  final String? parentId;
  final int? sequenceId;
  final int sortOrder;
  final String assigneeIds;
  final String labelIds;
  final String? cycleId;
  final String? moduleId;
  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? estimate;
  final bool isDirty;
  final int localVersion;
  final int? serverVersion;
  const WorkItemsTableData({
    required this.id,
    required this.projectId,
    required this.workspaceSlug,
    required this.name,
    this.description,
    this.descriptionHtml,
    this.stateId,
    required this.priority,
    this.startDate,
    this.targetDate,
    this.parentId,
    this.sequenceId,
    required this.sortOrder,
    required this.assigneeIds,
    required this.labelIds,
    this.cycleId,
    this.moduleId,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.estimate,
    required this.isDirty,
    required this.localVersion,
    this.serverVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['workspace_slug'] = Variable<String>(workspaceSlug);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || descriptionHtml != null) {
      map['description_html'] = Variable<String>(descriptionHtml);
    }
    if (!nullToAbsent || stateId != null) {
      map['state_id'] = Variable<String>(stateId);
    }
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || sequenceId != null) {
      map['sequence_id'] = Variable<int>(sequenceId);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['assignee_ids'] = Variable<String>(assigneeIds);
    map['label_ids'] = Variable<String>(labelIds);
    if (!nullToAbsent || cycleId != null) {
      map['cycle_id'] = Variable<String>(cycleId);
    }
    if (!nullToAbsent || moduleId != null) {
      map['module_id'] = Variable<String>(moduleId);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || estimate != null) {
      map['estimate'] = Variable<int>(estimate);
    }
    map['is_dirty'] = Variable<bool>(isDirty);
    map['local_version'] = Variable<int>(localVersion);
    if (!nullToAbsent || serverVersion != null) {
      map['server_version'] = Variable<int>(serverVersion);
    }
    return map;
  }

  WorkItemsTableCompanion toCompanion(bool nullToAbsent) {
    return WorkItemsTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      workspaceSlug: Value(workspaceSlug),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      descriptionHtml: descriptionHtml == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionHtml),
      stateId: stateId == null && nullToAbsent
          ? const Value.absent()
          : Value(stateId),
      priority: Value(priority),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      sequenceId: sequenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sequenceId),
      sortOrder: Value(sortOrder),
      assigneeIds: Value(assigneeIds),
      labelIds: Value(labelIds),
      cycleId: cycleId == null && nullToAbsent
          ? const Value.absent()
          : Value(cycleId),
      moduleId: moduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(moduleId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      estimate: estimate == null && nullToAbsent
          ? const Value.absent()
          : Value(estimate),
      isDirty: Value(isDirty),
      localVersion: Value(localVersion),
      serverVersion: serverVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(serverVersion),
    );
  }

  factory WorkItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      workspaceSlug: serializer.fromJson<String>(json['workspaceSlug']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      descriptionHtml: serializer.fromJson<String?>(json['descriptionHtml']),
      stateId: serializer.fromJson<String?>(json['stateId']),
      priority: serializer.fromJson<int>(json['priority']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      sequenceId: serializer.fromJson<int?>(json['sequenceId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      assigneeIds: serializer.fromJson<String>(json['assigneeIds']),
      labelIds: serializer.fromJson<String>(json['labelIds']),
      cycleId: serializer.fromJson<String?>(json['cycleId']),
      moduleId: serializer.fromJson<String?>(json['moduleId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      estimate: serializer.fromJson<int?>(json['estimate']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      localVersion: serializer.fromJson<int>(json['localVersion']),
      serverVersion: serializer.fromJson<int?>(json['serverVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'workspaceSlug': serializer.toJson<String>(workspaceSlug),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'descriptionHtml': serializer.toJson<String?>(descriptionHtml),
      'stateId': serializer.toJson<String?>(stateId),
      'priority': serializer.toJson<int>(priority),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
      'parentId': serializer.toJson<String?>(parentId),
      'sequenceId': serializer.toJson<int?>(sequenceId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'assigneeIds': serializer.toJson<String>(assigneeIds),
      'labelIds': serializer.toJson<String>(labelIds),
      'cycleId': serializer.toJson<String?>(cycleId),
      'moduleId': serializer.toJson<String?>(moduleId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'estimate': serializer.toJson<int?>(estimate),
      'isDirty': serializer.toJson<bool>(isDirty),
      'localVersion': serializer.toJson<int>(localVersion),
      'serverVersion': serializer.toJson<int?>(serverVersion),
    };
  }

  WorkItemsTableData copyWith({
    String? id,
    String? projectId,
    String? workspaceSlug,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> descriptionHtml = const Value.absent(),
    Value<String?> stateId = const Value.absent(),
    int? priority,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> targetDate = const Value.absent(),
    Value<String?> parentId = const Value.absent(),
    Value<int?> sequenceId = const Value.absent(),
    int? sortOrder,
    String? assigneeIds,
    String? labelIds,
    Value<String?> cycleId = const Value.absent(),
    Value<String?> moduleId = const Value.absent(),
    Value<String?> createdById = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<int?> estimate = const Value.absent(),
    bool? isDirty,
    int? localVersion,
    Value<int?> serverVersion = const Value.absent(),
  }) => WorkItemsTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    workspaceSlug: workspaceSlug ?? this.workspaceSlug,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    descriptionHtml: descriptionHtml.present
        ? descriptionHtml.value
        : this.descriptionHtml,
    stateId: stateId.present ? stateId.value : this.stateId,
    priority: priority ?? this.priority,
    startDate: startDate.present ? startDate.value : this.startDate,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    parentId: parentId.present ? parentId.value : this.parentId,
    sequenceId: sequenceId.present ? sequenceId.value : this.sequenceId,
    sortOrder: sortOrder ?? this.sortOrder,
    assigneeIds: assigneeIds ?? this.assigneeIds,
    labelIds: labelIds ?? this.labelIds,
    cycleId: cycleId.present ? cycleId.value : this.cycleId,
    moduleId: moduleId.present ? moduleId.value : this.moduleId,
    createdById: createdById.present ? createdById.value : this.createdById,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    estimate: estimate.present ? estimate.value : this.estimate,
    isDirty: isDirty ?? this.isDirty,
    localVersion: localVersion ?? this.localVersion,
    serverVersion: serverVersion.present
        ? serverVersion.value
        : this.serverVersion,
  );
  WorkItemsTableData copyWithCompanion(WorkItemsTableCompanion data) {
    return WorkItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      workspaceSlug: data.workspaceSlug.present
          ? data.workspaceSlug.value
          : this.workspaceSlug,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      descriptionHtml: data.descriptionHtml.present
          ? data.descriptionHtml.value
          : this.descriptionHtml,
      stateId: data.stateId.present ? data.stateId.value : this.stateId,
      priority: data.priority.present ? data.priority.value : this.priority,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      sequenceId: data.sequenceId.present
          ? data.sequenceId.value
          : this.sequenceId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      assigneeIds: data.assigneeIds.present
          ? data.assigneeIds.value
          : this.assigneeIds,
      labelIds: data.labelIds.present ? data.labelIds.value : this.labelIds,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      moduleId: data.moduleId.present ? data.moduleId.value : this.moduleId,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      estimate: data.estimate.present ? data.estimate.value : this.estimate,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      localVersion: data.localVersion.present
          ? data.localVersion.value
          : this.localVersion,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkItemsTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('workspaceSlug: $workspaceSlug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('descriptionHtml: $descriptionHtml, ')
          ..write('stateId: $stateId, ')
          ..write('priority: $priority, ')
          ..write('startDate: $startDate, ')
          ..write('targetDate: $targetDate, ')
          ..write('parentId: $parentId, ')
          ..write('sequenceId: $sequenceId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('assigneeIds: $assigneeIds, ')
          ..write('labelIds: $labelIds, ')
          ..write('cycleId: $cycleId, ')
          ..write('moduleId: $moduleId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('estimate: $estimate, ')
          ..write('isDirty: $isDirty, ')
          ..write('localVersion: $localVersion, ')
          ..write('serverVersion: $serverVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    projectId,
    workspaceSlug,
    name,
    description,
    descriptionHtml,
    stateId,
    priority,
    startDate,
    targetDate,
    parentId,
    sequenceId,
    sortOrder,
    assigneeIds,
    labelIds,
    cycleId,
    moduleId,
    createdById,
    createdAt,
    updatedAt,
    estimate,
    isDirty,
    localVersion,
    serverVersion,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkItemsTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.workspaceSlug == this.workspaceSlug &&
          other.name == this.name &&
          other.description == this.description &&
          other.descriptionHtml == this.descriptionHtml &&
          other.stateId == this.stateId &&
          other.priority == this.priority &&
          other.startDate == this.startDate &&
          other.targetDate == this.targetDate &&
          other.parentId == this.parentId &&
          other.sequenceId == this.sequenceId &&
          other.sortOrder == this.sortOrder &&
          other.assigneeIds == this.assigneeIds &&
          other.labelIds == this.labelIds &&
          other.cycleId == this.cycleId &&
          other.moduleId == this.moduleId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.estimate == this.estimate &&
          other.isDirty == this.isDirty &&
          other.localVersion == this.localVersion &&
          other.serverVersion == this.serverVersion);
}

class WorkItemsTableCompanion extends UpdateCompanion<WorkItemsTableData> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> workspaceSlug;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> descriptionHtml;
  final Value<String?> stateId;
  final Value<int> priority;
  final Value<DateTime?> startDate;
  final Value<DateTime?> targetDate;
  final Value<String?> parentId;
  final Value<int?> sequenceId;
  final Value<int> sortOrder;
  final Value<String> assigneeIds;
  final Value<String> labelIds;
  final Value<String?> cycleId;
  final Value<String?> moduleId;
  final Value<String?> createdById;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int?> estimate;
  final Value<bool> isDirty;
  final Value<int> localVersion;
  final Value<int?> serverVersion;
  final Value<int> rowid;
  const WorkItemsTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.workspaceSlug = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionHtml = const Value.absent(),
    this.stateId = const Value.absent(),
    this.priority = const Value.absent(),
    this.startDate = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.parentId = const Value.absent(),
    this.sequenceId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.assigneeIds = const Value.absent(),
    this.labelIds = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.moduleId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.estimate = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.localVersion = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkItemsTableCompanion.insert({
    required String id,
    required String projectId,
    required String workspaceSlug,
    required String name,
    this.description = const Value.absent(),
    this.descriptionHtml = const Value.absent(),
    this.stateId = const Value.absent(),
    this.priority = const Value.absent(),
    this.startDate = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.parentId = const Value.absent(),
    this.sequenceId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.assigneeIds = const Value.absent(),
    this.labelIds = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.moduleId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.estimate = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.localVersion = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       workspaceSlug = Value(workspaceSlug),
       name = Value(name);
  static Insertable<WorkItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? workspaceSlug,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? descriptionHtml,
    Expression<String>? stateId,
    Expression<int>? priority,
    Expression<DateTime>? startDate,
    Expression<DateTime>? targetDate,
    Expression<String>? parentId,
    Expression<int>? sequenceId,
    Expression<int>? sortOrder,
    Expression<String>? assigneeIds,
    Expression<String>? labelIds,
    Expression<String>? cycleId,
    Expression<String>? moduleId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? estimate,
    Expression<bool>? isDirty,
    Expression<int>? localVersion,
    Expression<int>? serverVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (workspaceSlug != null) 'workspace_slug': workspaceSlug,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (descriptionHtml != null) 'description_html': descriptionHtml,
      if (stateId != null) 'state_id': stateId,
      if (priority != null) 'priority': priority,
      if (startDate != null) 'start_date': startDate,
      if (targetDate != null) 'target_date': targetDate,
      if (parentId != null) 'parent_id': parentId,
      if (sequenceId != null) 'sequence_id': sequenceId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (assigneeIds != null) 'assignee_ids': assigneeIds,
      if (labelIds != null) 'label_ids': labelIds,
      if (cycleId != null) 'cycle_id': cycleId,
      if (moduleId != null) 'module_id': moduleId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (estimate != null) 'estimate': estimate,
      if (isDirty != null) 'is_dirty': isDirty,
      if (localVersion != null) 'local_version': localVersion,
      if (serverVersion != null) 'server_version': serverVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? workspaceSlug,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? descriptionHtml,
    Value<String?>? stateId,
    Value<int>? priority,
    Value<DateTime?>? startDate,
    Value<DateTime?>? targetDate,
    Value<String?>? parentId,
    Value<int?>? sequenceId,
    Value<int>? sortOrder,
    Value<String>? assigneeIds,
    Value<String>? labelIds,
    Value<String?>? cycleId,
    Value<String?>? moduleId,
    Value<String?>? createdById,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int?>? estimate,
    Value<bool>? isDirty,
    Value<int>? localVersion,
    Value<int?>? serverVersion,
    Value<int>? rowid,
  }) {
    return WorkItemsTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      workspaceSlug: workspaceSlug ?? this.workspaceSlug,
      name: name ?? this.name,
      description: description ?? this.description,
      descriptionHtml: descriptionHtml ?? this.descriptionHtml,
      stateId: stateId ?? this.stateId,
      priority: priority ?? this.priority,
      startDate: startDate ?? this.startDate,
      targetDate: targetDate ?? this.targetDate,
      parentId: parentId ?? this.parentId,
      sequenceId: sequenceId ?? this.sequenceId,
      sortOrder: sortOrder ?? this.sortOrder,
      assigneeIds: assigneeIds ?? this.assigneeIds,
      labelIds: labelIds ?? this.labelIds,
      cycleId: cycleId ?? this.cycleId,
      moduleId: moduleId ?? this.moduleId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      estimate: estimate ?? this.estimate,
      isDirty: isDirty ?? this.isDirty,
      localVersion: localVersion ?? this.localVersion,
      serverVersion: serverVersion ?? this.serverVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (workspaceSlug.present) {
      map['workspace_slug'] = Variable<String>(workspaceSlug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionHtml.present) {
      map['description_html'] = Variable<String>(descriptionHtml.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<String>(stateId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (sequenceId.present) {
      map['sequence_id'] = Variable<int>(sequenceId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (assigneeIds.present) {
      map['assignee_ids'] = Variable<String>(assigneeIds.value);
    }
    if (labelIds.present) {
      map['label_ids'] = Variable<String>(labelIds.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<String>(cycleId.value);
    }
    if (moduleId.present) {
      map['module_id'] = Variable<String>(moduleId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (estimate.present) {
      map['estimate'] = Variable<int>(estimate.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (localVersion.present) {
      map['local_version'] = Variable<int>(localVersion.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('workspaceSlug: $workspaceSlug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('descriptionHtml: $descriptionHtml, ')
          ..write('stateId: $stateId, ')
          ..write('priority: $priority, ')
          ..write('startDate: $startDate, ')
          ..write('targetDate: $targetDate, ')
          ..write('parentId: $parentId, ')
          ..write('sequenceId: $sequenceId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('assigneeIds: $assigneeIds, ')
          ..write('labelIds: $labelIds, ')
          ..write('cycleId: $cycleId, ')
          ..write('moduleId: $moduleId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('estimate: $estimate, ')
          ..write('isDirty: $isDirty, ')
          ..write('localVersion: $localVersion, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CyclesTableTable extends CyclesTable
    with TableInfo<$CyclesTableTable, CyclesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CyclesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalIssuesMeta = const VerificationMeta(
    'totalIssues',
  );
  @override
  late final GeneratedColumn<int> totalIssues = GeneratedColumn<int>(
    'total_issues',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedIssuesMeta = const VerificationMeta(
    'completedIssues',
  );
  @override
  late final GeneratedColumn<int> completedIssues = GeneratedColumn<int>(
    'completed_issues',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    description,
    startDate,
    endDate,
    status,
    totalIssues,
    completedIssues,
    progress,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cycles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CyclesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('total_issues')) {
      context.handle(
        _totalIssuesMeta,
        totalIssues.isAcceptableOrUnknown(
          data['total_issues']!,
          _totalIssuesMeta,
        ),
      );
    }
    if (data.containsKey('completed_issues')) {
      context.handle(
        _completedIssuesMeta,
        completedIssues.isAcceptableOrUnknown(
          data['completed_issues']!,
          _completedIssuesMeta,
        ),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CyclesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CyclesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      totalIssues: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_issues'],
      ),
      completedIssues: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_issues'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      ),
    );
  }

  @override
  $CyclesTableTable createAlias(String alias) {
    return $CyclesTableTable(attachedDatabase, alias);
  }
}

class CyclesTableData extends DataClass implements Insertable<CyclesTableData> {
  final String id;
  final String projectId;
  final String name;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final int status;
  final int? totalIssues;
  final int? completedIssues;
  final double? progress;
  const CyclesTableData({
    required this.id,
    required this.projectId,
    required this.name,
    this.description,
    this.startDate,
    this.endDate,
    required this.status,
    this.totalIssues,
    this.completedIssues,
    this.progress,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || totalIssues != null) {
      map['total_issues'] = Variable<int>(totalIssues);
    }
    if (!nullToAbsent || completedIssues != null) {
      map['completed_issues'] = Variable<int>(completedIssues);
    }
    if (!nullToAbsent || progress != null) {
      map['progress'] = Variable<double>(progress);
    }
    return map;
  }

  CyclesTableCompanion toCompanion(bool nullToAbsent) {
    return CyclesTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      status: Value(status),
      totalIssues: totalIssues == null && nullToAbsent
          ? const Value.absent()
          : Value(totalIssues),
      completedIssues: completedIssues == null && nullToAbsent
          ? const Value.absent()
          : Value(completedIssues),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
    );
  }

  factory CyclesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CyclesTableData(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      status: serializer.fromJson<int>(json['status']),
      totalIssues: serializer.fromJson<int?>(json['totalIssues']),
      completedIssues: serializer.fromJson<int?>(json['completedIssues']),
      progress: serializer.fromJson<double?>(json['progress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'status': serializer.toJson<int>(status),
      'totalIssues': serializer.toJson<int?>(totalIssues),
      'completedIssues': serializer.toJson<int?>(completedIssues),
      'progress': serializer.toJson<double?>(progress),
    };
  }

  CyclesTableData copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    int? status,
    Value<int?> totalIssues = const Value.absent(),
    Value<int?> completedIssues = const Value.absent(),
    Value<double?> progress = const Value.absent(),
  }) => CyclesTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    status: status ?? this.status,
    totalIssues: totalIssues.present ? totalIssues.value : this.totalIssues,
    completedIssues: completedIssues.present
        ? completedIssues.value
        : this.completedIssues,
    progress: progress.present ? progress.value : this.progress,
  );
  CyclesTableData copyWithCompanion(CyclesTableCompanion data) {
    return CyclesTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      totalIssues: data.totalIssues.present
          ? data.totalIssues.value
          : this.totalIssues,
      completedIssues: data.completedIssues.present
          ? data.completedIssues.value
          : this.completedIssues,
      progress: data.progress.present ? data.progress.value : this.progress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CyclesTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('totalIssues: $totalIssues, ')
          ..write('completedIssues: $completedIssues, ')
          ..write('progress: $progress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    description,
    startDate,
    endDate,
    status,
    totalIssues,
    completedIssues,
    progress,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CyclesTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.totalIssues == this.totalIssues &&
          other.completedIssues == this.completedIssues &&
          other.progress == this.progress);
}

class CyclesTableCompanion extends UpdateCompanion<CyclesTableData> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<int> status;
  final Value<int?> totalIssues;
  final Value<int?> completedIssues;
  final Value<double?> progress;
  final Value<int> rowid;
  const CyclesTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.totalIssues = const Value.absent(),
    this.completedIssues = const Value.absent(),
    this.progress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CyclesTableCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.totalIssues = const Value.absent(),
    this.completedIssues = const Value.absent(),
    this.progress = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<CyclesTableData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? status,
    Expression<int>? totalIssues,
    Expression<int>? completedIssues,
    Expression<double>? progress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (totalIssues != null) 'total_issues': totalIssues,
      if (completedIssues != null) 'completed_issues': completedIssues,
      if (progress != null) 'progress': progress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CyclesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<int>? status,
    Value<int?>? totalIssues,
    Value<int?>? completedIssues,
    Value<double?>? progress,
    Value<int>? rowid,
  }) {
    return CyclesTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      totalIssues: totalIssues ?? this.totalIssues,
      completedIssues: completedIssues ?? this.completedIssues,
      progress: progress ?? this.progress,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (totalIssues.present) {
      map['total_issues'] = Variable<int>(totalIssues.value);
    }
    if (completedIssues.present) {
      map['completed_issues'] = Variable<int>(completedIssues.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CyclesTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('totalIssues: $totalIssues, ')
          ..write('completedIssues: $completedIssues, ')
          ..write('progress: $progress, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ModulesTableTable extends ModulesTable
    with TableInfo<$ModulesTableTable, ModulesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModulesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    description,
    status,
    startDate,
    targetDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'modules_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModulesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModulesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModulesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
    );
  }

  @override
  $ModulesTableTable createAlias(String alias) {
    return $ModulesTableTable(attachedDatabase, alias);
  }
}

class ModulesTableData extends DataClass
    implements Insertable<ModulesTableData> {
  final String id;
  final String projectId;
  final String name;
  final String? description;
  final int status;
  final DateTime? startDate;
  final DateTime? targetDate;
  const ModulesTableData({
    required this.id,
    required this.projectId,
    required this.name,
    this.description,
    required this.status,
    this.startDate,
    this.targetDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    return map;
  }

  ModulesTableCompanion toCompanion(bool nullToAbsent) {
    return ModulesTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
    );
  }

  factory ModulesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModulesTableData(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<int>(json['status']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<int>(status),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
    };
  }

  ModulesTableData copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> description = const Value.absent(),
    int? status,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> targetDate = const Value.absent(),
  }) => ModulesTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    status: status ?? this.status,
    startDate: startDate.present ? startDate.value : this.startDate,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
  );
  ModulesTableData copyWithCompanion(ModulesTableCompanion data) {
    return ModulesTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      status: data.status.present ? data.status.value : this.status,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModulesTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('targetDate: $targetDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    projectId,
    name,
    description,
    status,
    startDate,
    targetDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModulesTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.description == this.description &&
          other.status == this.status &&
          other.startDate == this.startDate &&
          other.targetDate == this.targetDate);
}

class ModulesTableCompanion extends UpdateCompanion<ModulesTableData> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> status;
  final Value<DateTime?> startDate;
  final Value<DateTime?> targetDate;
  final Value<int> rowid;
  const ModulesTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.startDate = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ModulesTableCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.startDate = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<ModulesTableData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? status,
    Expression<DateTime>? startDate,
    Expression<DateTime>? targetDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (startDate != null) 'start_date': startDate,
      if (targetDate != null) 'target_date': targetDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ModulesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? status,
    Value<DateTime?>? startDate,
    Value<DateTime?>? targetDate,
    Value<int>? rowid,
  }) {
    return ModulesTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      targetDate: targetDate ?? this.targetDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModulesTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('targetDate: $targetDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatesTableTable extends StatesTable
    with TableInfo<$StatesTableTable, StatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupValueMeta = const VerificationMeta(
    'groupValue',
  );
  @override
  late final GeneratedColumn<int> groupValue = GeneratedColumn<int>(
    'group_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    projectId,
    name,
    groupValue,
    color,
    sequence,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'states_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('group_value')) {
      context.handle(
        _groupValueMeta,
        groupValue.isAcceptableOrUnknown(data['group_value']!, _groupValueMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      groupValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_value'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      )!,
    );
  }

  @override
  $StatesTableTable createAlias(String alias) {
    return $StatesTableTable(attachedDatabase, alias);
  }
}

class StatesTableData extends DataClass implements Insertable<StatesTableData> {
  final String id;
  final String projectId;
  final String name;
  final int groupValue;
  final String? color;
  final int sequence;
  const StatesTableData({
    required this.id,
    required this.projectId,
    required this.name,
    required this.groupValue,
    this.color,
    required this.sequence,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    map['group_value'] = Variable<int>(groupValue);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['sequence'] = Variable<int>(sequence);
    return map;
  }

  StatesTableCompanion toCompanion(bool nullToAbsent) {
    return StatesTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      groupValue: Value(groupValue),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      sequence: Value(sequence),
    );
  }

  factory StatesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatesTableData(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      groupValue: serializer.fromJson<int>(json['groupValue']),
      color: serializer.fromJson<String?>(json['color']),
      sequence: serializer.fromJson<int>(json['sequence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'groupValue': serializer.toJson<int>(groupValue),
      'color': serializer.toJson<String?>(color),
      'sequence': serializer.toJson<int>(sequence),
    };
  }

  StatesTableData copyWith({
    String? id,
    String? projectId,
    String? name,
    int? groupValue,
    Value<String?> color = const Value.absent(),
    int? sequence,
  }) => StatesTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    groupValue: groupValue ?? this.groupValue,
    color: color.present ? color.value : this.color,
    sequence: sequence ?? this.sequence,
  );
  StatesTableData copyWithCompanion(StatesTableCompanion data) {
    return StatesTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      groupValue: data.groupValue.present
          ? data.groupValue.value
          : this.groupValue,
      color: data.color.present ? data.color.value : this.color,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatesTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('groupValue: $groupValue, ')
          ..write('color: $color, ')
          ..write('sequence: $sequence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, projectId, name, groupValue, color, sequence);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatesTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.groupValue == this.groupValue &&
          other.color == this.color &&
          other.sequence == this.sequence);
}

class StatesTableCompanion extends UpdateCompanion<StatesTableData> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<int> groupValue;
  final Value<String?> color;
  final Value<int> sequence;
  final Value<int> rowid;
  const StatesTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.groupValue = const Value.absent(),
    this.color = const Value.absent(),
    this.sequence = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatesTableCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.groupValue = const Value.absent(),
    this.color = const Value.absent(),
    this.sequence = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<StatesTableData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<int>? groupValue,
    Expression<String>? color,
    Expression<int>? sequence,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (groupValue != null) 'group_value': groupValue,
      if (color != null) 'color': color,
      if (sequence != null) 'sequence': sequence,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<int>? groupValue,
    Value<String?>? color,
    Value<int>? sequence,
    Value<int>? rowid,
  }) {
    return StatesTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      groupValue: groupValue ?? this.groupValue,
      color: color ?? this.color,
      sequence: sequence ?? this.sequence,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (groupValue.present) {
      map['group_value'] = Variable<int>(groupValue.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatesTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('groupValue: $groupValue, ')
          ..write('color: $color, ')
          ..write('sequence: $sequence, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LabelsTableTable extends LabelsTable
    with TableInfo<$LabelsTableTable, LabelsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LabelsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, projectId, name, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'labels_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<LabelsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LabelsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LabelsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
    );
  }

  @override
  $LabelsTableTable createAlias(String alias) {
    return $LabelsTableTable(attachedDatabase, alias);
  }
}

class LabelsTableData extends DataClass implements Insertable<LabelsTableData> {
  final String id;
  final String projectId;
  final String name;
  final String? color;
  const LabelsTableData({
    required this.id,
    required this.projectId,
    required this.name,
    this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['project_id'] = Variable<String>(projectId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    return map;
  }

  LabelsTableCompanion toCompanion(bool nullToAbsent) {
    return LabelsTableCompanion(
      id: Value(id),
      projectId: Value(projectId),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
    );
  }

  factory LabelsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LabelsTableData(
      id: serializer.fromJson<String>(json['id']),
      projectId: serializer.fromJson<String>(json['projectId']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'projectId': serializer.toJson<String>(projectId),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
    };
  }

  LabelsTableData copyWith({
    String? id,
    String? projectId,
    String? name,
    Value<String?> color = const Value.absent(),
  }) => LabelsTableData(
    id: id ?? this.id,
    projectId: projectId ?? this.projectId,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
  );
  LabelsTableData copyWithCompanion(LabelsTableCompanion data) {
    return LabelsTableData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LabelsTableData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LabelsTableData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.name == this.name &&
          other.color == this.color);
}

class LabelsTableCompanion extends UpdateCompanion<LabelsTableData> {
  final Value<String> id;
  final Value<String> projectId;
  final Value<String> name;
  final Value<String?> color;
  final Value<int> rowid;
  const LabelsTableCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LabelsTableCompanion.insert({
    required String id,
    required String projectId,
    required String name,
    this.color = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       projectId = Value(projectId),
       name = Value(name);
  static Insertable<LabelsTableData> custom({
    Expression<String>? id,
    Expression<String>? projectId,
    Expression<String>? name,
    Expression<String>? color,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LabelsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? projectId,
    Value<String>? name,
    Value<String?>? color,
    Value<int>? rowid,
  }) {
    return LabelsTableCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      name: name ?? this.name,
      color: color ?? this.color,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabelsTableCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommentsTableTable extends CommentsTable
    with TableInfo<$CommentsTableTable, CommentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _workItemIdMeta = const VerificationMeta(
    'workItemId',
  );
  @override
  late final GeneratedColumn<String> workItemId = GeneratedColumn<String>(
    'work_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdByIdMeta = const VerificationMeta(
    'createdById',
  );
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
    'created_by_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workItemId,
    body,
    createdById,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('work_item_id')) {
      context.handle(
        _workItemIdMeta,
        workItemId.isAcceptableOrUnknown(
          data['work_item_id']!,
          _workItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workItemIdMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
        _createdByIdMeta,
        createdById.isAcceptableOrUnknown(
          data['created_by_id']!,
          _createdByIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      workItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work_item_id'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdById: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CommentsTableTable createAlias(String alias) {
    return $CommentsTableTable(attachedDatabase, alias);
  }
}

class CommentsTableData extends DataClass
    implements Insertable<CommentsTableData> {
  final String id;
  final String workItemId;
  final String body;
  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const CommentsTableData({
    required this.id,
    required this.workItemId,
    required this.body,
    this.createdById,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['work_item_id'] = Variable<String>(workItemId);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CommentsTableCompanion toCompanion(bool nullToAbsent) {
    return CommentsTableCompanion(
      id: Value(id),
      workItemId: Value(workItemId),
      body: Value(body),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CommentsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentsTableData(
      id: serializer.fromJson<String>(json['id']),
      workItemId: serializer.fromJson<String>(json['workItemId']),
      body: serializer.fromJson<String>(json['body']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workItemId': serializer.toJson<String>(workItemId),
      'body': serializer.toJson<String>(body),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  CommentsTableData copyWith({
    String? id,
    String? workItemId,
    String? body,
    Value<String?> createdById = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => CommentsTableData(
    id: id ?? this.id,
    workItemId: workItemId ?? this.workItemId,
    body: body ?? this.body,
    createdById: createdById.present ? createdById.value : this.createdById,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CommentsTableData copyWithCompanion(CommentsTableCompanion data) {
    return CommentsTableData(
      id: data.id.present ? data.id.value : this.id,
      workItemId: data.workItemId.present
          ? data.workItemId.value
          : this.workItemId,
      body: data.body.present ? data.body.value : this.body,
      createdById: data.createdById.present
          ? data.createdById.value
          : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentsTableData(')
          ..write('id: $id, ')
          ..write('workItemId: $workItemId, ')
          ..write('body: $body, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, workItemId, body, createdById, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentsTableData &&
          other.id == this.id &&
          other.workItemId == this.workItemId &&
          other.body == this.body &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CommentsTableCompanion extends UpdateCompanion<CommentsTableData> {
  final Value<String> id;
  final Value<String> workItemId;
  final Value<String> body;
  final Value<String?> createdById;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const CommentsTableCompanion({
    this.id = const Value.absent(),
    this.workItemId = const Value.absent(),
    this.body = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommentsTableCompanion.insert({
    required String id,
    required String workItemId,
    required String body,
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       workItemId = Value(workItemId),
       body = Value(body);
  static Insertable<CommentsTableData> custom({
    Expression<String>? id,
    Expression<String>? workItemId,
    Expression<String>? body,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workItemId != null) 'work_item_id': workItemId,
      if (body != null) 'body': body,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? workItemId,
    Value<String>? body,
    Value<String?>? createdById,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return CommentsTableCompanion(
      id: id ?? this.id,
      workItemId: workItemId ?? this.workItemId,
      body: body ?? this.body,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workItemId.present) {
      map['work_item_id'] = Variable<String>(workItemId.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsTableCompanion(')
          ..write('id: $id, ')
          ..write('workItemId: $workItemId, ')
          ..write('body: $body, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTableTable extends SyncQueueTable
    with TableInfo<$SyncQueueTableTable, SyncQueueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptAtMeta = const VerificationMeta(
    'lastAttemptAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptAt =
      GeneratedColumn<DateTime>(
        'last_attempt_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operation,
    priority,
    payload,
    createdAt,
    attempts,
    lastAttemptAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
        _lastAttemptAtMeta,
        lastAttemptAt.isAcceptableOrUnknown(
          data['last_attempt_at']!,
          _lastAttemptAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}priority'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
      lastAttemptAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempt_at'],
      ),
    );
  }

  @override
  $SyncQueueTableTable createAlias(String alias) {
    return $SyncQueueTableTable(attachedDatabase, alias);
  }
}

class SyncQueueTableData extends DataClass
    implements Insertable<SyncQueueTableData> {
  final int id;
  final String entityType;
  final String entityId;
  final String operation;
  final int priority;
  final String payload;
  final DateTime createdAt;
  final int attempts;
  final DateTime? lastAttemptAt;
  const SyncQueueTableData({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.priority,
    required this.payload,
    required this.createdAt,
    required this.attempts,
    this.lastAttemptAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['priority'] = Variable<int>(priority);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt);
    }
    return map;
  }

  SyncQueueTableCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      priority: Value(priority),
      payload: Value(payload),
      createdAt: Value(createdAt),
      attempts: Value(attempts),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
    );
  }

  factory SyncQueueTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueTableData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      priority: serializer.fromJson<int>(json['priority']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      attempts: serializer.fromJson<int>(json['attempts']),
      lastAttemptAt: serializer.fromJson<DateTime?>(json['lastAttemptAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'priority': serializer.toJson<int>(priority),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'attempts': serializer.toJson<int>(attempts),
      'lastAttemptAt': serializer.toJson<DateTime?>(lastAttemptAt),
    };
  }

  SyncQueueTableData copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? operation,
    int? priority,
    String? payload,
    DateTime? createdAt,
    int? attempts,
    Value<DateTime?> lastAttemptAt = const Value.absent(),
  }) => SyncQueueTableData(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operation: operation ?? this.operation,
    priority: priority ?? this.priority,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    attempts: attempts ?? this.attempts,
    lastAttemptAt: lastAttemptAt.present
        ? lastAttemptAt.value
        : this.lastAttemptAt,
  );
  SyncQueueTableData copyWithCompanion(SyncQueueTableCompanion data) {
    return SyncQueueTableData(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      priority: data.priority.present ? data.priority.value : this.priority,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('priority: $priority, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operation,
    priority,
    payload,
    createdAt,
    attempts,
    lastAttemptAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueTableData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.priority == this.priority &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.attempts == this.attempts &&
          other.lastAttemptAt == this.lastAttemptAt);
}

class SyncQueueTableCompanion extends UpdateCompanion<SyncQueueTableData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<int> priority;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> attempts;
  final Value<DateTime?> lastAttemptAt;
  const SyncQueueTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.priority = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  });
  SyncQueueTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String operation,
    this.priority = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.attempts = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation);
  static Insertable<SyncQueueTableData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<int>? priority,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? attempts,
    Expression<DateTime>? lastAttemptAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (priority != null) 'priority': priority,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (attempts != null) 'attempts': attempts,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
    });
  }

  SyncQueueTableCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operation,
    Value<int>? priority,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? attempts,
    Value<DateTime?>? lastAttemptAt,
  }) {
    return SyncQueueTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      priority: priority ?? this.priority,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      attempts: attempts ?? this.attempts,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<DateTime>(lastAttemptAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('priority: $priority, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts, ')
          ..write('lastAttemptAt: $lastAttemptAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$PlaneDatabase extends GeneratedDatabase {
  _$PlaneDatabase(QueryExecutor e) : super(e);
  $PlaneDatabaseManager get managers => $PlaneDatabaseManager(this);
  late final $WorkspacesTableTable workspacesTable = $WorkspacesTableTable(
    this,
  );
  late final $MembersTableTable membersTable = $MembersTableTable(this);
  late final $ProjectsTableTable projectsTable = $ProjectsTableTable(this);
  late final $WorkItemsTableTable workItemsTable = $WorkItemsTableTable(this);
  late final $CyclesTableTable cyclesTable = $CyclesTableTable(this);
  late final $ModulesTableTable modulesTable = $ModulesTableTable(this);
  late final $StatesTableTable statesTable = $StatesTableTable(this);
  late final $LabelsTableTable labelsTable = $LabelsTableTable(this);
  late final $CommentsTableTable commentsTable = $CommentsTableTable(this);
  late final $SyncQueueTableTable syncQueueTable = $SyncQueueTableTable(this);
  late final WorkspaceDao workspaceDao = WorkspaceDao(this as PlaneDatabase);
  late final MemberDao memberDao = MemberDao(this as PlaneDatabase);
  late final ProjectDao projectDao = ProjectDao(this as PlaneDatabase);
  late final WorkItemDao workItemDao = WorkItemDao(this as PlaneDatabase);
  late final CycleDao cycleDao = CycleDao(this as PlaneDatabase);
  late final ModuleDao moduleDao = ModuleDao(this as PlaneDatabase);
  late final StateDao stateDao = StateDao(this as PlaneDatabase);
  late final LabelDao labelDao = LabelDao(this as PlaneDatabase);
  late final CommentDao commentDao = CommentDao(this as PlaneDatabase);
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as PlaneDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    workspacesTable,
    membersTable,
    projectsTable,
    workItemsTable,
    cyclesTable,
    modulesTable,
    statesTable,
    labelsTable,
    commentsTable,
    syncQueueTable,
  ];
}

typedef $$WorkspacesTableTableCreateCompanionBuilder =
    WorkspacesTableCompanion Function({
      required String id,
      required String name,
      required String slug,
      Value<String?> logo,
      Value<int> rowid,
    });
typedef $$WorkspacesTableTableUpdateCompanionBuilder =
    WorkspacesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> slug,
      Value<String?> logo,
      Value<int> rowid,
    });

class $$WorkspacesTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $WorkspacesTableTable> {
  $$WorkspacesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkspacesTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $WorkspacesTableTable> {
  $$WorkspacesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logo => $composableBuilder(
    column: $table.logo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkspacesTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $WorkspacesTableTable> {
  $$WorkspacesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);
}

class $$WorkspacesTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $WorkspacesTableTable,
          WorkspacesTableData,
          $$WorkspacesTableTableFilterComposer,
          $$WorkspacesTableTableOrderingComposer,
          $$WorkspacesTableTableAnnotationComposer,
          $$WorkspacesTableTableCreateCompanionBuilder,
          $$WorkspacesTableTableUpdateCompanionBuilder,
          (
            WorkspacesTableData,
            BaseReferences<
              _$PlaneDatabase,
              $WorkspacesTableTable,
              WorkspacesTableData
            >,
          ),
          WorkspacesTableData,
          PrefetchHooks Function()
        > {
  $$WorkspacesTableTableTableManager(
    _$PlaneDatabase db,
    $WorkspacesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkspacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkspacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkspacesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String?> logo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspacesTableCompanion(
                id: id,
                name: name,
                slug: slug,
                logo: logo,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String slug,
                Value<String?> logo = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspacesTableCompanion.insert(
                id: id,
                name: name,
                slug: slug,
                logo: logo,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkspacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $WorkspacesTableTable,
      WorkspacesTableData,
      $$WorkspacesTableTableFilterComposer,
      $$WorkspacesTableTableOrderingComposer,
      $$WorkspacesTableTableAnnotationComposer,
      $$WorkspacesTableTableCreateCompanionBuilder,
      $$WorkspacesTableTableUpdateCompanionBuilder,
      (
        WorkspacesTableData,
        BaseReferences<
          _$PlaneDatabase,
          $WorkspacesTableTable,
          WorkspacesTableData
        >,
      ),
      WorkspacesTableData,
      PrefetchHooks Function()
    >;
typedef $$MembersTableTableCreateCompanionBuilder =
    MembersTableCompanion Function({
      required String id,
      required String workspaceId,
      required String userId,
      required int role,
      Value<String?> email,
      Value<String?> displayName,
      Value<String?> avatar,
      Value<int> rowid,
    });
typedef $$MembersTableTableUpdateCompanionBuilder =
    MembersTableCompanion Function({
      Value<String> id,
      Value<String> workspaceId,
      Value<String> userId,
      Value<int> role,
      Value<String?> email,
      Value<String?> displayName,
      Value<String?> avatar,
      Value<int> rowid,
    });

class $$MembersTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $MembersTableTable> {
  $$MembersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MembersTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $MembersTableTable> {
  $$MembersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MembersTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $MembersTableTable> {
  $$MembersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);
}

class $$MembersTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $MembersTableTable,
          MembersTableData,
          $$MembersTableTableFilterComposer,
          $$MembersTableTableOrderingComposer,
          $$MembersTableTableAnnotationComposer,
          $$MembersTableTableCreateCompanionBuilder,
          $$MembersTableTableUpdateCompanionBuilder,
          (
            MembersTableData,
            BaseReferences<
              _$PlaneDatabase,
              $MembersTableTable,
              MembersTableData
            >,
          ),
          MembersTableData,
          PrefetchHooks Function()
        > {
  $$MembersTableTableTableManager(_$PlaneDatabase db, $MembersTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MembersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MembersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MembersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int> role = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MembersTableCompanion(
                id: id,
                workspaceId: workspaceId,
                userId: userId,
                role: role,
                email: email,
                displayName: displayName,
                avatar: avatar,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String workspaceId,
                required String userId,
                required int role,
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MembersTableCompanion.insert(
                id: id,
                workspaceId: workspaceId,
                userId: userId,
                role: role,
                email: email,
                displayName: displayName,
                avatar: avatar,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MembersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $MembersTableTable,
      MembersTableData,
      $$MembersTableTableFilterComposer,
      $$MembersTableTableOrderingComposer,
      $$MembersTableTableAnnotationComposer,
      $$MembersTableTableCreateCompanionBuilder,
      $$MembersTableTableUpdateCompanionBuilder,
      (
        MembersTableData,
        BaseReferences<_$PlaneDatabase, $MembersTableTable, MembersTableData>,
      ),
      MembersTableData,
      PrefetchHooks Function()
    >;
typedef $$ProjectsTableTableCreateCompanionBuilder =
    ProjectsTableCompanion Function({
      required String id,
      required String workspaceId,
      required String name,
      Value<String?> description,
      Value<String?> identifier,
      Value<String?> emoji,
      Value<String?> coverImage,
      Value<int> network,
      Value<bool> isArchived,
      Value<bool> isFavorite,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$ProjectsTableTableUpdateCompanionBuilder =
    ProjectsTableCompanion Function({
      Value<String> id,
      Value<String> workspaceId,
      Value<String> name,
      Value<String?> description,
      Value<String?> identifier,
      Value<String?> emoji,
      Value<String?> coverImage,
      Value<int> network,
      Value<bool> isArchived,
      Value<bool> isFavorite,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$ProjectsTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identifier => $composableBuilder(
    column: $table.identifier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImage => $composableBuilder(
    column: $table.coverImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectsTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identifier => $composableBuilder(
    column: $table.identifier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImage => $composableBuilder(
    column: $table.coverImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get network => $composableBuilder(
    column: $table.network,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $ProjectsTableTable> {
  $$ProjectsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get identifier => $composableBuilder(
    column: $table.identifier,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get coverImage => $composableBuilder(
    column: $table.coverImage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get network =>
      $composableBuilder(column: $table.network, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProjectsTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $ProjectsTableTable,
          ProjectsTableData,
          $$ProjectsTableTableFilterComposer,
          $$ProjectsTableTableOrderingComposer,
          $$ProjectsTableTableAnnotationComposer,
          $$ProjectsTableTableCreateCompanionBuilder,
          $$ProjectsTableTableUpdateCompanionBuilder,
          (
            ProjectsTableData,
            BaseReferences<
              _$PlaneDatabase,
              $ProjectsTableTable,
              ProjectsTableData
            >,
          ),
          ProjectsTableData,
          PrefetchHooks Function()
        > {
  $$ProjectsTableTableTableManager(
    _$PlaneDatabase db,
    $ProjectsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> identifier = const Value.absent(),
                Value<String?> emoji = const Value.absent(),
                Value<String?> coverImage = const Value.absent(),
                Value<int> network = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsTableCompanion(
                id: id,
                workspaceId: workspaceId,
                name: name,
                description: description,
                identifier: identifier,
                emoji: emoji,
                coverImage: coverImage,
                network: network,
                isArchived: isArchived,
                isFavorite: isFavorite,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String workspaceId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> identifier = const Value.absent(),
                Value<String?> emoji = const Value.absent(),
                Value<String?> coverImage = const Value.absent(),
                Value<int> network = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsTableCompanion.insert(
                id: id,
                workspaceId: workspaceId,
                name: name,
                description: description,
                identifier: identifier,
                emoji: emoji,
                coverImage: coverImage,
                network: network,
                isArchived: isArchived,
                isFavorite: isFavorite,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $ProjectsTableTable,
      ProjectsTableData,
      $$ProjectsTableTableFilterComposer,
      $$ProjectsTableTableOrderingComposer,
      $$ProjectsTableTableAnnotationComposer,
      $$ProjectsTableTableCreateCompanionBuilder,
      $$ProjectsTableTableUpdateCompanionBuilder,
      (
        ProjectsTableData,
        BaseReferences<_$PlaneDatabase, $ProjectsTableTable, ProjectsTableData>,
      ),
      ProjectsTableData,
      PrefetchHooks Function()
    >;
typedef $$WorkItemsTableTableCreateCompanionBuilder =
    WorkItemsTableCompanion Function({
      required String id,
      required String projectId,
      required String workspaceSlug,
      required String name,
      Value<String?> description,
      Value<String?> descriptionHtml,
      Value<String?> stateId,
      Value<int> priority,
      Value<DateTime?> startDate,
      Value<DateTime?> targetDate,
      Value<String?> parentId,
      Value<int?> sequenceId,
      Value<int> sortOrder,
      Value<String> assigneeIds,
      Value<String> labelIds,
      Value<String?> cycleId,
      Value<String?> moduleId,
      Value<String?> createdById,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> estimate,
      Value<bool> isDirty,
      Value<int> localVersion,
      Value<int?> serverVersion,
      Value<int> rowid,
    });
typedef $$WorkItemsTableTableUpdateCompanionBuilder =
    WorkItemsTableCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> workspaceSlug,
      Value<String> name,
      Value<String?> description,
      Value<String?> descriptionHtml,
      Value<String?> stateId,
      Value<int> priority,
      Value<DateTime?> startDate,
      Value<DateTime?> targetDate,
      Value<String?> parentId,
      Value<int?> sequenceId,
      Value<int> sortOrder,
      Value<String> assigneeIds,
      Value<String> labelIds,
      Value<String?> cycleId,
      Value<String?> moduleId,
      Value<String?> createdById,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int?> estimate,
      Value<bool> isDirty,
      Value<int> localVersion,
      Value<int?> serverVersion,
      Value<int> rowid,
    });

class $$WorkItemsTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $WorkItemsTableTable> {
  $$WorkItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workspaceSlug => $composableBuilder(
    column: $table.workspaceSlug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionHtml => $composableBuilder(
    column: $table.descriptionHtml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequenceId => $composableBuilder(
    column: $table.sequenceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get assigneeIds => $composableBuilder(
    column: $table.assigneeIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labelIds => $composableBuilder(
    column: $table.labelIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cycleId => $composableBuilder(
    column: $table.cycleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimate => $composableBuilder(
    column: $table.estimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localVersion => $composableBuilder(
    column: $table.localVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkItemsTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $WorkItemsTableTable> {
  $$WorkItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workspaceSlug => $composableBuilder(
    column: $table.workspaceSlug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionHtml => $composableBuilder(
    column: $table.descriptionHtml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateId => $composableBuilder(
    column: $table.stateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequenceId => $composableBuilder(
    column: $table.sequenceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get assigneeIds => $composableBuilder(
    column: $table.assigneeIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labelIds => $composableBuilder(
    column: $table.labelIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cycleId => $composableBuilder(
    column: $table.cycleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimate => $composableBuilder(
    column: $table.estimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDirty => $composableBuilder(
    column: $table.isDirty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localVersion => $composableBuilder(
    column: $table.localVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkItemsTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $WorkItemsTableTable> {
  $$WorkItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get workspaceSlug => $composableBuilder(
    column: $table.workspaceSlug,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionHtml => $composableBuilder(
    column: $table.descriptionHtml,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stateId =>
      $composableBuilder(column: $table.stateId, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<int> get sequenceId => $composableBuilder(
    column: $table.sequenceId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get assigneeIds => $composableBuilder(
    column: $table.assigneeIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get labelIds =>
      $composableBuilder(column: $table.labelIds, builder: (column) => column);

  GeneratedColumn<String> get cycleId =>
      $composableBuilder(column: $table.cycleId, builder: (column) => column);

  GeneratedColumn<String> get moduleId =>
      $composableBuilder(column: $table.moduleId, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get estimate =>
      $composableBuilder(column: $table.estimate, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<int> get localVersion => $composableBuilder(
    column: $table.localVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );
}

class $$WorkItemsTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $WorkItemsTableTable,
          WorkItemsTableData,
          $$WorkItemsTableTableFilterComposer,
          $$WorkItemsTableTableOrderingComposer,
          $$WorkItemsTableTableAnnotationComposer,
          $$WorkItemsTableTableCreateCompanionBuilder,
          $$WorkItemsTableTableUpdateCompanionBuilder,
          (
            WorkItemsTableData,
            BaseReferences<
              _$PlaneDatabase,
              $WorkItemsTableTable,
              WorkItemsTableData
            >,
          ),
          WorkItemsTableData,
          PrefetchHooks Function()
        > {
  $$WorkItemsTableTableTableManager(
    _$PlaneDatabase db,
    $WorkItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkItemsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> workspaceSlug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> descriptionHtml = const Value.absent(),
                Value<String?> stateId = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<int?> sequenceId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String> assigneeIds = const Value.absent(),
                Value<String> labelIds = const Value.absent(),
                Value<String?> cycleId = const Value.absent(),
                Value<String?> moduleId = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> estimate = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<int> localVersion = const Value.absent(),
                Value<int?> serverVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkItemsTableCompanion(
                id: id,
                projectId: projectId,
                workspaceSlug: workspaceSlug,
                name: name,
                description: description,
                descriptionHtml: descriptionHtml,
                stateId: stateId,
                priority: priority,
                startDate: startDate,
                targetDate: targetDate,
                parentId: parentId,
                sequenceId: sequenceId,
                sortOrder: sortOrder,
                assigneeIds: assigneeIds,
                labelIds: labelIds,
                cycleId: cycleId,
                moduleId: moduleId,
                createdById: createdById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                estimate: estimate,
                isDirty: isDirty,
                localVersion: localVersion,
                serverVersion: serverVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String workspaceSlug,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> descriptionHtml = const Value.absent(),
                Value<String?> stateId = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<int?> sequenceId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String> assigneeIds = const Value.absent(),
                Value<String> labelIds = const Value.absent(),
                Value<String?> cycleId = const Value.absent(),
                Value<String?> moduleId = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int?> estimate = const Value.absent(),
                Value<bool> isDirty = const Value.absent(),
                Value<int> localVersion = const Value.absent(),
                Value<int?> serverVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkItemsTableCompanion.insert(
                id: id,
                projectId: projectId,
                workspaceSlug: workspaceSlug,
                name: name,
                description: description,
                descriptionHtml: descriptionHtml,
                stateId: stateId,
                priority: priority,
                startDate: startDate,
                targetDate: targetDate,
                parentId: parentId,
                sequenceId: sequenceId,
                sortOrder: sortOrder,
                assigneeIds: assigneeIds,
                labelIds: labelIds,
                cycleId: cycleId,
                moduleId: moduleId,
                createdById: createdById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                estimate: estimate,
                isDirty: isDirty,
                localVersion: localVersion,
                serverVersion: serverVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $WorkItemsTableTable,
      WorkItemsTableData,
      $$WorkItemsTableTableFilterComposer,
      $$WorkItemsTableTableOrderingComposer,
      $$WorkItemsTableTableAnnotationComposer,
      $$WorkItemsTableTableCreateCompanionBuilder,
      $$WorkItemsTableTableUpdateCompanionBuilder,
      (
        WorkItemsTableData,
        BaseReferences<
          _$PlaneDatabase,
          $WorkItemsTableTable,
          WorkItemsTableData
        >,
      ),
      WorkItemsTableData,
      PrefetchHooks Function()
    >;
typedef $$CyclesTableTableCreateCompanionBuilder =
    CyclesTableCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> description,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> status,
      Value<int?> totalIssues,
      Value<int?> completedIssues,
      Value<double?> progress,
      Value<int> rowid,
    });
typedef $$CyclesTableTableUpdateCompanionBuilder =
    CyclesTableCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> description,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> status,
      Value<int?> totalIssues,
      Value<int?> completedIssues,
      Value<double?> progress,
      Value<int> rowid,
    });

class $$CyclesTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $CyclesTableTable> {
  $$CyclesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalIssues => $composableBuilder(
    column: $table.totalIssues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedIssues => $composableBuilder(
    column: $table.completedIssues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CyclesTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $CyclesTableTable> {
  $$CyclesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalIssues => $composableBuilder(
    column: $table.totalIssues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedIssues => $composableBuilder(
    column: $table.completedIssues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CyclesTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $CyclesTableTable> {
  $$CyclesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get totalIssues => $composableBuilder(
    column: $table.totalIssues,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedIssues => $composableBuilder(
    column: $table.completedIssues,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);
}

class $$CyclesTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $CyclesTableTable,
          CyclesTableData,
          $$CyclesTableTableFilterComposer,
          $$CyclesTableTableOrderingComposer,
          $$CyclesTableTableAnnotationComposer,
          $$CyclesTableTableCreateCompanionBuilder,
          $$CyclesTableTableUpdateCompanionBuilder,
          (
            CyclesTableData,
            BaseReferences<_$PlaneDatabase, $CyclesTableTable, CyclesTableData>,
          ),
          CyclesTableData,
          PrefetchHooks Function()
        > {
  $$CyclesTableTableTableManager(_$PlaneDatabase db, $CyclesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CyclesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CyclesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CyclesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int?> totalIssues = const Value.absent(),
                Value<int?> completedIssues = const Value.absent(),
                Value<double?> progress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CyclesTableCompanion(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                startDate: startDate,
                endDate: endDate,
                status: status,
                totalIssues: totalIssues,
                completedIssues: completedIssues,
                progress: progress,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int?> totalIssues = const Value.absent(),
                Value<int?> completedIssues = const Value.absent(),
                Value<double?> progress = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CyclesTableCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                startDate: startDate,
                endDate: endDate,
                status: status,
                totalIssues: totalIssues,
                completedIssues: completedIssues,
                progress: progress,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CyclesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $CyclesTableTable,
      CyclesTableData,
      $$CyclesTableTableFilterComposer,
      $$CyclesTableTableOrderingComposer,
      $$CyclesTableTableAnnotationComposer,
      $$CyclesTableTableCreateCompanionBuilder,
      $$CyclesTableTableUpdateCompanionBuilder,
      (
        CyclesTableData,
        BaseReferences<_$PlaneDatabase, $CyclesTableTable, CyclesTableData>,
      ),
      CyclesTableData,
      PrefetchHooks Function()
    >;
typedef $$ModulesTableTableCreateCompanionBuilder =
    ModulesTableCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> description,
      Value<int> status,
      Value<DateTime?> startDate,
      Value<DateTime?> targetDate,
      Value<int> rowid,
    });
typedef $$ModulesTableTableUpdateCompanionBuilder =
    ModulesTableCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> description,
      Value<int> status,
      Value<DateTime?> startDate,
      Value<DateTime?> targetDate,
      Value<int> rowid,
    });

class $$ModulesTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $ModulesTableTable> {
  $$ModulesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ModulesTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $ModulesTableTable> {
  $$ModulesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ModulesTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $ModulesTableTable> {
  $$ModulesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );
}

class $$ModulesTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $ModulesTableTable,
          ModulesTableData,
          $$ModulesTableTableFilterComposer,
          $$ModulesTableTableOrderingComposer,
          $$ModulesTableTableAnnotationComposer,
          $$ModulesTableTableCreateCompanionBuilder,
          $$ModulesTableTableUpdateCompanionBuilder,
          (
            ModulesTableData,
            BaseReferences<
              _$PlaneDatabase,
              $ModulesTableTable,
              ModulesTableData
            >,
          ),
          ModulesTableData,
          PrefetchHooks Function()
        > {
  $$ModulesTableTableTableManager(_$PlaneDatabase db, $ModulesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModulesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModulesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModulesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModulesTableCompanion(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                status: status,
                startDate: startDate,
                targetDate: targetDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModulesTableCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                description: description,
                status: status,
                startDate: startDate,
                targetDate: targetDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ModulesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $ModulesTableTable,
      ModulesTableData,
      $$ModulesTableTableFilterComposer,
      $$ModulesTableTableOrderingComposer,
      $$ModulesTableTableAnnotationComposer,
      $$ModulesTableTableCreateCompanionBuilder,
      $$ModulesTableTableUpdateCompanionBuilder,
      (
        ModulesTableData,
        BaseReferences<_$PlaneDatabase, $ModulesTableTable, ModulesTableData>,
      ),
      ModulesTableData,
      PrefetchHooks Function()
    >;
typedef $$StatesTableTableCreateCompanionBuilder =
    StatesTableCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<int> groupValue,
      Value<String?> color,
      Value<int> sequence,
      Value<int> rowid,
    });
typedef $$StatesTableTableUpdateCompanionBuilder =
    StatesTableCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<int> groupValue,
      Value<String?> color,
      Value<int> sequence,
      Value<int> rowid,
    });

class $$StatesTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $StatesTableTable> {
  $$StatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get groupValue => $composableBuilder(
    column: $table.groupValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StatesTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $StatesTableTable> {
  $$StatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get groupValue => $composableBuilder(
    column: $table.groupValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StatesTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $StatesTableTable> {
  $$StatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get groupValue => $composableBuilder(
    column: $table.groupValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);
}

class $$StatesTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $StatesTableTable,
          StatesTableData,
          $$StatesTableTableFilterComposer,
          $$StatesTableTableOrderingComposer,
          $$StatesTableTableAnnotationComposer,
          $$StatesTableTableCreateCompanionBuilder,
          $$StatesTableTableUpdateCompanionBuilder,
          (
            StatesTableData,
            BaseReferences<_$PlaneDatabase, $StatesTableTable, StatesTableData>,
          ),
          StatesTableData,
          PrefetchHooks Function()
        > {
  $$StatesTableTableTableManager(_$PlaneDatabase db, $StatesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> groupValue = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> sequence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatesTableCompanion(
                id: id,
                projectId: projectId,
                name: name,
                groupValue: groupValue,
                color: color,
                sequence: sequence,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<int> groupValue = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> sequence = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatesTableCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                groupValue: groupValue,
                color: color,
                sequence: sequence,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StatesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $StatesTableTable,
      StatesTableData,
      $$StatesTableTableFilterComposer,
      $$StatesTableTableOrderingComposer,
      $$StatesTableTableAnnotationComposer,
      $$StatesTableTableCreateCompanionBuilder,
      $$StatesTableTableUpdateCompanionBuilder,
      (
        StatesTableData,
        BaseReferences<_$PlaneDatabase, $StatesTableTable, StatesTableData>,
      ),
      StatesTableData,
      PrefetchHooks Function()
    >;
typedef $$LabelsTableTableCreateCompanionBuilder =
    LabelsTableCompanion Function({
      required String id,
      required String projectId,
      required String name,
      Value<String?> color,
      Value<int> rowid,
    });
typedef $$LabelsTableTableUpdateCompanionBuilder =
    LabelsTableCompanion Function({
      Value<String> id,
      Value<String> projectId,
      Value<String> name,
      Value<String?> color,
      Value<int> rowid,
    });

class $$LabelsTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $LabelsTableTable> {
  $$LabelsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LabelsTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $LabelsTableTable> {
  $$LabelsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LabelsTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $LabelsTableTable> {
  $$LabelsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);
}

class $$LabelsTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $LabelsTableTable,
          LabelsTableData,
          $$LabelsTableTableFilterComposer,
          $$LabelsTableTableOrderingComposer,
          $$LabelsTableTableAnnotationComposer,
          $$LabelsTableTableCreateCompanionBuilder,
          $$LabelsTableTableUpdateCompanionBuilder,
          (
            LabelsTableData,
            BaseReferences<_$PlaneDatabase, $LabelsTableTable, LabelsTableData>,
          ),
          LabelsTableData,
          PrefetchHooks Function()
        > {
  $$LabelsTableTableTableManager(_$PlaneDatabase db, $LabelsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LabelsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LabelsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LabelsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LabelsTableCompanion(
                id: id,
                projectId: projectId,
                name: name,
                color: color,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String projectId,
                required String name,
                Value<String?> color = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LabelsTableCompanion.insert(
                id: id,
                projectId: projectId,
                name: name,
                color: color,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LabelsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $LabelsTableTable,
      LabelsTableData,
      $$LabelsTableTableFilterComposer,
      $$LabelsTableTableOrderingComposer,
      $$LabelsTableTableAnnotationComposer,
      $$LabelsTableTableCreateCompanionBuilder,
      $$LabelsTableTableUpdateCompanionBuilder,
      (
        LabelsTableData,
        BaseReferences<_$PlaneDatabase, $LabelsTableTable, LabelsTableData>,
      ),
      LabelsTableData,
      PrefetchHooks Function()
    >;
typedef $$CommentsTableTableCreateCompanionBuilder =
    CommentsTableCompanion Function({
      required String id,
      required String workItemId,
      required String body,
      Value<String?> createdById,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$CommentsTableTableUpdateCompanionBuilder =
    CommentsTableCompanion Function({
      Value<String> id,
      Value<String> workItemId,
      Value<String> body,
      Value<String?> createdById,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$CommentsTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $CommentsTableTable> {
  $$CommentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workItemId => $composableBuilder(
    column: $table.workItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentsTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $CommentsTableTable> {
  $$CommentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workItemId => $composableBuilder(
    column: $table.workItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentsTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $CommentsTableTable> {
  $$CommentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get workItemId => $composableBuilder(
    column: $table.workItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
    column: $table.createdById,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CommentsTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $CommentsTableTable,
          CommentsTableData,
          $$CommentsTableTableFilterComposer,
          $$CommentsTableTableOrderingComposer,
          $$CommentsTableTableAnnotationComposer,
          $$CommentsTableTableCreateCompanionBuilder,
          $$CommentsTableTableUpdateCompanionBuilder,
          (
            CommentsTableData,
            BaseReferences<
              _$PlaneDatabase,
              $CommentsTableTable,
              CommentsTableData
            >,
          ),
          CommentsTableData,
          PrefetchHooks Function()
        > {
  $$CommentsTableTableTableManager(
    _$PlaneDatabase db,
    $CommentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> workItemId = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String?> createdById = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentsTableCompanion(
                id: id,
                workItemId: workItemId,
                body: body,
                createdById: createdById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String workItemId,
                required String body,
                Value<String?> createdById = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentsTableCompanion.insert(
                id: id,
                workItemId: workItemId,
                body: body,
                createdById: createdById,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $CommentsTableTable,
      CommentsTableData,
      $$CommentsTableTableFilterComposer,
      $$CommentsTableTableOrderingComposer,
      $$CommentsTableTableAnnotationComposer,
      $$CommentsTableTableCreateCompanionBuilder,
      $$CommentsTableTableUpdateCompanionBuilder,
      (
        CommentsTableData,
        BaseReferences<_$PlaneDatabase, $CommentsTableTable, CommentsTableData>,
      ),
      CommentsTableData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableTableCreateCompanionBuilder =
    SyncQueueTableCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityId,
      required String operation,
      Value<int> priority,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> attempts,
      Value<DateTime?> lastAttemptAt,
    });
typedef $$SyncQueueTableTableUpdateCompanionBuilder =
    SyncQueueTableCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> operation,
      Value<int> priority,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> attempts,
      Value<DateTime?> lastAttemptAt,
    });

class $$SyncQueueTableTableFilterComposer
    extends Composer<_$PlaneDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableTableOrderingComposer
    extends Composer<_$PlaneDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableTableAnnotationComposer
    extends Composer<_$PlaneDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAttemptAt => $composableBuilder(
    column: $table.lastAttemptAt,
    builder: (column) => column,
  );
}

class $$SyncQueueTableTableTableManager
    extends
        RootTableManager<
          _$PlaneDatabase,
          $SyncQueueTableTable,
          SyncQueueTableData,
          $$SyncQueueTableTableFilterComposer,
          $$SyncQueueTableTableOrderingComposer,
          $$SyncQueueTableTableAnnotationComposer,
          $$SyncQueueTableTableCreateCompanionBuilder,
          $$SyncQueueTableTableUpdateCompanionBuilder,
          (
            SyncQueueTableData,
            BaseReferences<
              _$PlaneDatabase,
              $SyncQueueTableTable,
              SyncQueueTableData
            >,
          ),
          SyncQueueTableData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableTableManager(
    _$PlaneDatabase db,
    $SyncQueueTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<int> priority = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
              }) => SyncQueueTableCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                priority: priority,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                lastAttemptAt: lastAttemptAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityId,
                required String operation,
                Value<int> priority = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
                Value<DateTime?> lastAttemptAt = const Value.absent(),
              }) => SyncQueueTableCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                priority: priority,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
                lastAttemptAt: lastAttemptAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlaneDatabase,
      $SyncQueueTableTable,
      SyncQueueTableData,
      $$SyncQueueTableTableFilterComposer,
      $$SyncQueueTableTableOrderingComposer,
      $$SyncQueueTableTableAnnotationComposer,
      $$SyncQueueTableTableCreateCompanionBuilder,
      $$SyncQueueTableTableUpdateCompanionBuilder,
      (
        SyncQueueTableData,
        BaseReferences<
          _$PlaneDatabase,
          $SyncQueueTableTable,
          SyncQueueTableData
        >,
      ),
      SyncQueueTableData,
      PrefetchHooks Function()
    >;

class $PlaneDatabaseManager {
  final _$PlaneDatabase _db;
  $PlaneDatabaseManager(this._db);
  $$WorkspacesTableTableTableManager get workspacesTable =>
      $$WorkspacesTableTableTableManager(_db, _db.workspacesTable);
  $$MembersTableTableTableManager get membersTable =>
      $$MembersTableTableTableManager(_db, _db.membersTable);
  $$ProjectsTableTableTableManager get projectsTable =>
      $$ProjectsTableTableTableManager(_db, _db.projectsTable);
  $$WorkItemsTableTableTableManager get workItemsTable =>
      $$WorkItemsTableTableTableManager(_db, _db.workItemsTable);
  $$CyclesTableTableTableManager get cyclesTable =>
      $$CyclesTableTableTableManager(_db, _db.cyclesTable);
  $$ModulesTableTableTableManager get modulesTable =>
      $$ModulesTableTableTableManager(_db, _db.modulesTable);
  $$StatesTableTableTableManager get statesTable =>
      $$StatesTableTableTableManager(_db, _db.statesTable);
  $$LabelsTableTableTableManager get labelsTable =>
      $$LabelsTableTableTableManager(_db, _db.labelsTable);
  $$CommentsTableTableTableManager get commentsTable =>
      $$CommentsTableTableTableManager(_db, _db.commentsTable);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(_db, _db.syncQueueTable);
}
