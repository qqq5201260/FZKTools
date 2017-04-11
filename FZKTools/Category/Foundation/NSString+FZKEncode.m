//
//  NSString+FZKEncode.m
//  FZKTools
//
//  Created by czl on 2017/3/21.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "NSString+FZKEncode.h"
#import <CommonCrypto/CommonDigest.h>

#import <UIKit/UIKit.h>



#if __has_include(<AFNetworking/AFNetworking.h>)
#import <ObjcAssociatedObjectHelpers/ObjcAssociatedObjectHelpers.h>//RSA依赖
#else
#import "ObjcAssociatedObjectHelpers.h"
#endif

@implementation NSString (FZKEncode)
/**
 *  MD5加密字符串
 */
- (NSString *)md5String {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    
    return ret;
}

+ (NSString *)md5StringFromSourceString:(NSString *)sourceString{
    
    return [sourceString md5String];
    
}

- (NSString*)base64EncodedString {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64DecodedString {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


SYNTHESIZE_ASC_OBJ(publicKey, setPublicKey);

- (SecKeyRef)getPublicKey {
    
    if (self.publicKey) {
        return (__bridge SecKeyRef)(self.publicKey);
    }
    
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"key" ofType:@"sr"];
    SecCertificateRef myCertificate = nil;
    NSData *certificateData = [[NSData alloc] initWithContentsOfFile:resourcePath];
    myCertificate = SecCertificateCreateWithData(kCFAllocatorDefault, (__bridge_retained CFDataRef) certificateData);
    SecPolicyRef policy = SecPolicyCreateBasicX509();
    SecTrustRef trust;
    OSStatus status = SecTrustCreateWithCertificates(myCertificate, policy, &trust);
    SecTrustResultType trustResult;
    if (status == noErr) {
        status = SecTrustEvaluate(trust, &trustResult);
    }
    
    self.publicKey = CFBridgingRelease(SecTrustCopyPublicKey(trust));
    return (__bridge SecKeyRef)((self.publicKey));
}

- (NSString *)RSAEncode {
    SecKeyRef publicKey = [self getPublicKey];
    size_t cipherBufferSize = SecKeyGetBlockSize(publicKey);
    uint8_t *cipherBuffer = malloc(cipherBufferSize);
    uint8_t *nonce = (uint8_t *) [self UTF8String];
    SecKeyEncrypt(publicKey,
                  kSecPaddingNone,
                  nonce,
                  strlen((char *) nonce),
                  &cipherBuffer[0],
                  &cipherBufferSize);
    NSData *encryptedData = [NSData dataWithBytes:cipherBuffer length:cipherBufferSize];
    free(cipherBuffer);
    
    NSString *endodedStr = [encryptedData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    
    return endodedStr;
}


@end
