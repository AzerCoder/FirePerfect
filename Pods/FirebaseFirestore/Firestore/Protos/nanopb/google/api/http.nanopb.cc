/*
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Automatically generated nanopb constant definitions */
/* Generated by nanopb-0.3.9.8 */

#include "http.nanopb.h"

#include "Firestore/core/src/nanopb/pretty_printing.h"

namespace firebase {
namespace firestore {

using nanopb::PrintEnumField;
using nanopb::PrintHeader;
using nanopb::PrintMessageField;
using nanopb::PrintPrimitiveField;
using nanopb::PrintTail;

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif



const pb_field_t google_api_Http_fields[3] = {
    PB_FIELD(  1, MESSAGE , REPEATED, POINTER , FIRST, google_api_Http, rules, rules, &google_api_HttpRule_fields),
    PB_FIELD(  2, BOOL    , SINGULAR, STATIC  , OTHER, google_api_Http, fully_decode_reserved_expansion, rules, 0),
    PB_LAST_FIELD
};

const pb_field_t google_api_HttpRule_fields[10] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_api_HttpRule, selector, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   2, BYTES   , ONEOF, POINTER , OTHER, google_api_HttpRule, get, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   3, BYTES   , ONEOF, POINTER , UNION, google_api_HttpRule, put, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   4, BYTES   , ONEOF, POINTER , UNION, google_api_HttpRule, post, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   5, BYTES   , ONEOF, POINTER , UNION, google_api_HttpRule, delete_, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   6, BYTES   , ONEOF, POINTER , UNION, google_api_HttpRule, patch, selector, 0),
    PB_ANONYMOUS_ONEOF_FIELD(pattern,   8, MESSAGE , ONEOF, STATIC  , UNION, google_api_HttpRule, custom, selector, &google_api_CustomHttpPattern_fields),
    PB_FIELD(  7, BYTES   , SINGULAR, POINTER , OTHER, google_api_HttpRule, body, custom, 0),
    PB_FIELD( 11, MESSAGE , REPEATED, POINTER , OTHER, google_api_HttpRule, additional_bindings, body, &google_api_HttpRule_fields),
    PB_LAST_FIELD
};

const pb_field_t google_api_CustomHttpPattern_fields[3] = {
    PB_FIELD(  1, BYTES   , SINGULAR, POINTER , FIRST, google_api_CustomHttpPattern, kind, kind, 0),
    PB_FIELD(  2, BYTES   , SINGULAR, POINTER , OTHER, google_api_CustomHttpPattern, path, kind, 0),
    PB_LAST_FIELD
};


/* Check that field information fits in pb_field_t */
#if !defined(PB_FIELD_32BIT)
/* If you get an error here, it means that you need to define PB_FIELD_32BIT
 * compile-time option. You can do that in pb.h or on compiler command line.
 *
 * The reason you need to do this is that some of your messages contain tag
 * numbers or field sizes that are larger than what can fit in 8 or 16 bit
 * field descriptors.
 */
PB_STATIC_ASSERT((pb_membersize(google_api_HttpRule, custom) < 65536), YOU_MUST_DEFINE_PB_FIELD_32BIT_FOR_MESSAGES_google_api_Http_google_api_HttpRule_google_api_CustomHttpPattern)
#endif

#if !defined(PB_FIELD_16BIT) && !defined(PB_FIELD_32BIT)
/* If you get an error here, it means that you need to define PB_FIELD_16BIT
 * compile-time option. You can do that in pb.h or on compiler command line.
 *
 * The reason you need to do this is that some of your messages contain tag
 * numbers or field sizes that are larger than what can fit in the default
 * 8 bit descriptors.
 */
PB_STATIC_ASSERT((pb_membersize(google_api_HttpRule, custom) < 256), YOU_MUST_DEFINE_PB_FIELD_16BIT_FOR_MESSAGES_google_api_Http_google_api_HttpRule_google_api_CustomHttpPattern)
#endif


std::string google_api_Http::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "Http", this);
    std::string tostring_result;

    for (pb_size_t i = 0; i != rules_count; ++i) {
        tostring_result += PrintMessageField("rules ",
            rules[i], indent + 1, true);
    }
    tostring_result += PrintPrimitiveField("fully_decode_reserved_expansion: ",
        fully_decode_reserved_expansion, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_api_HttpRule::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "HttpRule", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("selector: ",
        selector, indent + 1, false);
    switch (which_pattern) {
    case google_api_HttpRule_get_tag:
        tostring_result += PrintPrimitiveField("get: ", get, indent + 1, true);
        break;
    case google_api_HttpRule_put_tag:
        tostring_result += PrintPrimitiveField("put: ", put, indent + 1, true);
        break;
    case google_api_HttpRule_post_tag:
        tostring_result += PrintPrimitiveField("post: ",
            post, indent + 1, true);
        break;
    case google_api_HttpRule_delete_tag:
        tostring_result += PrintPrimitiveField("delete: ",
            delete_, indent + 1, true);
        break;
    case google_api_HttpRule_patch_tag:
        tostring_result += PrintPrimitiveField("patch: ",
            patch, indent + 1, true);
        break;
    case google_api_HttpRule_custom_tag:
        tostring_result += PrintMessageField("custom ",
            custom, indent + 1, true);
        break;
    }
    tostring_result += PrintPrimitiveField("body: ", body, indent + 1, false);
    for (pb_size_t i = 0; i != additional_bindings_count; ++i) {
        tostring_result += PrintMessageField("additional_bindings ",
            additional_bindings[i], indent + 1, true);
    }

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

std::string google_api_CustomHttpPattern::ToString(int indent) const {
    std::string tostring_header = PrintHeader(indent, "CustomHttpPattern", this);
    std::string tostring_result;

    tostring_result += PrintPrimitiveField("kind: ", kind, indent + 1, false);
    tostring_result += PrintPrimitiveField("path: ", path, indent + 1, false);

    bool is_root = indent == 0;
    if (!tostring_result.empty() || is_root) {
      std::string tostring_tail = PrintTail(indent);
      return tostring_header + tostring_result + tostring_tail;
    } else {
      return "";
    }
}

}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */