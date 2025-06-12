class Links {
final String? status;
final String? message;
final Data? data;
final dynamic errors;
const Links({this.status , this.message , this.data , this.errors });
Links copyWith({String? status, String? message, Data? data, dynamic? errors}){
return Links(
            status:status ?? this.status,
message:message ?? this.message,
data:data ?? this.data,
errors:errors ?? this.errors
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'status': status,
'message': message,
'data': data?.toJson(),
'errors': errors
    };
}

static Links fromJson(Map<String , Object?> json){
    return Links(
            status:json['status'] == null ? null : json['status'] as String,
message:json['message'] == null ? null : json['message'] as String,
data:json['data'] == null ? null : Data.fromJson(json['data']  as Map<String,Object?>),
errors:json['errors'] as dynamic
    );
}

@override
String toString(){
    return '''Links(
                status:$status,
message:$message,
data:${data.toString()},
errors:$errors
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Links && 
        other.runtimeType == runtimeType &&
        other.status == status && 
other.message == message && 
other.data == data && 
other.errors == errors;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                status, 
message, 
data, 
errors
    );
}
    
}
      
      
class Data {
final SocialLinks? socialLinks;
const Data({this.socialLinks });
Data copyWith({SocialLinks? socialLinks}){
return Data(
            socialLinks:socialLinks ?? this.socialLinks
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'socialLinks': socialLinks?.toJson()
    };
}

static Data fromJson(Map<String , Object?> json){
    return Data(
            socialLinks:json['socialLinks'] == null ? null : SocialLinks.fromJson(json['socialLinks']  as Map<String,Object?>)
    );
}

@override
String toString(){
    return '''Data(
                socialLinks:${socialLinks.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Data && 
        other.runtimeType == runtimeType &&
        other.socialLinks == socialLinks;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                socialLinks
    );
}
    
}
      
      
class SocialLinks {
final String? twitter;
final String? instagram;
final String? snapchat;
final String? tiktok;
final String? whatsApp;
const SocialLinks({this.twitter , this.instagram , this.snapchat , this.tiktok , this.whatsApp });
SocialLinks copyWith({String? twitter, String? instagram, String? snapchat, String? tiktok, String? whatsApp}){
return SocialLinks(
            twitter:twitter ?? this.twitter,
instagram:instagram ?? this.instagram,
snapchat:snapchat ?? this.snapchat,
tiktok:tiktok ?? this.tiktok,
whatsApp:whatsApp ?? this.whatsApp
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'twitter': twitter,
'instagram': instagram,
'snapchat': snapchat,
'tiktok': tiktok,
'whatsApp': whatsApp
    };
}

static SocialLinks fromJson(Map<String , Object?> json){
    return SocialLinks(
            twitter:json['twitter'] == null ? null : json['twitter'] as String,
instagram:json['instagram'] == null ? null : json['instagram'] as String,
snapchat:json['snapchat'] == null ? null : json['snapchat'] as String,
tiktok:json['tiktok'] == null ? null : json['tiktok'] as String,
whatsApp:json['whatsApp'] == null ? null : json['whatsApp'] as String
    );
}

@override
String toString(){
    return '''SocialLinks(
                twitter:$twitter,
instagram:$instagram,
snapchat:$snapchat,
tiktok:$tiktok,
whatsApp:$whatsApp
    ) ''';
}

@override
bool operator ==(Object other){
    return other is SocialLinks && 
        other.runtimeType == runtimeType &&
        other.twitter == twitter && 
other.instagram == instagram && 
other.snapchat == snapchat && 
other.tiktok == tiktok && 
other.whatsApp == whatsApp;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                twitter, 
instagram, 
snapchat, 
tiktok, 
whatsApp
    );
}
    
}
      
      
  
     