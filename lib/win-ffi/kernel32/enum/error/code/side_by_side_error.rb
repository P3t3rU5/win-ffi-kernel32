module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of Side By Side Error Codes 14000 to 14999 ===#
        # MessageId: ERROR_SXS_SECTION_NOT_FOUND
        # MessageText:
        # The requested section was not present in the activation context.
        :SXS_SECTION_NOT_FOUND, 14000,
        # MessageId: ERROR_SXS_CANT_GEN_ACTCTX
        # MessageText:
        # The application has failed to start because its side-by-side configuration is incorrect. Please see the
        # application event log or use the command-line sxstrace.exe tool for more detail.
        :SXS_CANT_GEN_ACTCTX, 14001,
        # MessageId: ERROR_SXS_INVALID_ACTCTXDATA_FORMAT
        # MessageText:
        # The application binding data format is invalid.
        :SXS_INVALID_ACTCTXDATA_FORMAT, 14002,
        # MessageId: ERROR_SXS_ASSEMBLY_NOT_FOUND
        # MessageText:
        # The referenced assembly is not installed on your system.
        :SXS_ASSEMBLY_NOT_FOUND, 14003,
        # MessageId: ERROR_SXS_MANIFEST_FORMAT_ERROR
        # MessageText:
        # The manifest file does not begin with the required tag and format information.
        :SXS_MANIFEST_FORMAT_ERROR, 14004,
        # MessageId: ERROR_SXS_MANIFEST_PARSE_ERROR
        # MessageText:
        # The manifest file contains one or more syntax errors.
        :SXS_MANIFEST_PARSE_ERROR, 14005,
        # MessageId: ERROR_SXS_ACTIVATION_CONTEXT_DISABLED
        # MessageText:
        # The application attempted to activate a disabled activation context.
        :SXS_ACTIVATION_CONTEXT_DISABLED, 14006,
        # MessageId: ERROR_SXS_KEY_NOT_FOUND
        # MessageText:
        # The requested lookup key was not found in any active activation context.
        :SXS_KEY_NOT_FOUND, 14007,
        # MessageId: ERROR_SXS_VERSION_CONFLICT
        # MessageText:
        # A component version required by the application conflicts with another component version already active.
        :SXS_VERSION_CONFLICT, 14008,
        # MessageId: ERROR_SXS_WRONG_SECTION_TYPE
        # MessageText:
        # The type requested activation context section does not match the query API used.
        :SXS_WRONG_SECTION_TYPE, 14009,
        # MessageId: ERROR_SXS_THREAD_QUERIES_DISABLED
        # MessageText:
        # Lack of system resources has required isolated activation to be disabled for the current thread of execution.
        :SXS_THREAD_QUERIES_DISABLED, 14010,
        # MessageId: ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET
        # MessageText:
        # An attempt to set the process default activation context failed because the process default activation context
        # was already set.
        :SXS_PROCESS_DEFAULT_ALREADY_SET, 14011,
        # MessageId: ERROR_SXS_UNKNOWN_ENCODING_GROUP
        # MessageText:
        # The encoding group identifier specified is not recognized.
        :SXS_UNKNOWN_ENCODING_GROUP, 14012,
        # MessageId: ERROR_SXS_UNKNOWN_ENCODING
        # MessageText:
        # The encoding requested is not recognized.
        :SXS_UNKNOWN_ENCODING, 14013,
        # MessageId: ERROR_SXS_INVALID_XML_NAMESPACE_URI
        # MessageText:
        # The manifest contains a reference to an invalid URI.
        :SXS_INVALID_XML_NAMESPACE_URI, 14014,
        # MessageId: ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED
        # MessageText:
        # The application manifest contains a reference to a dependent assembly which is not installed
        :SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED, 14015,
        # MessageId: ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED
        # MessageText:
        # The manifest for an assembly used by the application has a reference to a dependent assembly which is not
        # installed
        :SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED, 14016,
        # MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE
        # MessageText:
        # The manifest contains an attribute for the assembly identity which is not valid.
        :SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE, 14017,
        # MessageId: ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE
        # MessageText:
        # The manifest is missing the required default namespace specification on the assembly element.
        :SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE, 14018,
        # MessageId: ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE
        # MessageText:
        # The manifest has a default namespace specified on the assembly element but its value is not
        # "urn:schemas-microsoft-com:asm.v1".
        :SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE, 14019,
        # MessageId: ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT
        # MessageText:
        # The private manifest probed has crossed a path with an unsupported reparse point.
        :SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT, 14020,
        # MessageId: ERROR_SXS_DUPLICATE_DLL_NAME
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have files by the same
        # name.
        :SXS_DUPLICATE_DLL_NAME, 14021,
        # MessageId: ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have window classes with
        # the same name.
        :SXS_DUPLICATE_WINDOWCLASS_NAME, 14022,
        # MessageId: ERROR_SXS_DUPLICATE_CLSID
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have the same COM server
        # CLSIDs.
        :SXS_DUPLICATE_CLSID, 14023,
        # MessageId: ERROR_SXS_DUPLICATE_IID
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have proxies for the same
        # COM interface IIDs.
        :SXS_DUPLICATE_IID, 14024,
        # MessageId: ERROR_SXS_DUPLICATE_TLBID
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have the same COM type
        # library TLBIDs.
        :SXS_DUPLICATE_TLBID, 14025,
        # MessageId: ERROR_SXS_DUPLICATE_PROGID
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest have the same COM ProgIDs
        :SXS_DUPLICATE_PROGID, 14026,
        # MessageId: ERROR_SXS_DUPLICATE_ASSEMBLY_NAME
        # MessageText:
        # Two or more components referenced directly or indirectly by the application manifest are different versions of
        # the same component which is not permitted.
        :SXS_DUPLICATE_ASSEMBLY_NAME, 14027,
        # MessageId: ERROR_SXS_FILE_HASH_MISMATCH
        # MessageText:
        # A component's file does not match the verification information present in the component manifest.
        :SXS_FILE_HASH_MISMATCH, 14028,
        # MessageId: ERROR_SXS_POLICY_PARSE_ERROR
        # MessageText:
        # The policy manifest contains one or more syntax errors.
        :SXS_POLICY_PARSE_ERROR, 14029,
        # MessageId: ERROR_SXS_XML_E_MISSINGQUOTE
        # MessageText:
        # Manifest Parse Error : A string literal was expected, but no opening quote character was found.
        :SXS_XML_E_MISSINGQUOTE, 14030,
        # MessageId: ERROR_SXS_XML_E_COMMENTSYNTAX
        # MessageText:
        # Manifest Parse Error : Incorrect syntax was used in a comment.
        :SXS_XML_E_COMMENTSYNTAX, 14031,
        # MessageId: ERROR_SXS_XML_E_BADSTARTNAMECHAR
        # MessageText:
        # Manifest Parse Error : A name was started with an invalid character.
        :SXS_XML_E_BADSTARTNAMECHAR, 14032,
        # MessageId: ERROR_SXS_XML_E_BADNAMECHAR
        # MessageText:
        # Manifest Parse Error : A name contained an invalid character.
        :SXS_XML_E_BADNAMECHAR, 14033,
        # MessageId: ERROR_SXS_XML_E_BADCHARINSTRING
        # MessageText:
        # Manifest Parse Error : A string literal contained an invalid character.
        :SXS_XML_E_BADCHARINSTRING, 14034,
        # MessageId: ERROR_SXS_XML_E_XMLDECLSYNTAX
        # MessageText:
        # Manifest Parse Error : Invalid syntax for an xml declaration.
        :SXS_XML_E_XMLDECLSYNTAX, 14035,
        # MessageId: ERROR_SXS_XML_E_BADCHARDATA
        # MessageText:
        # Manifest Parse Error : An Invalid character was found in text content.
        :SXS_XML_E_BADCHARDATA, 14036,
        # MessageId: ERROR_SXS_XML_E_MISSINGWHITESPACE
        # MessageText:
        # Manifest Parse Error : Required white space was missing.
        :SXS_XML_E_MISSINGWHITESPACE, 14037,
        # MessageId: ERROR_SXS_XML_E_EXPECTINGTAGEND
        # MessageText:
        # Manifest Parse Error : The character '>' was expected.
        :SXS_XML_E_EXPECTINGTAGEND, 14038,
        # MessageId: ERROR_SXS_XML_E_MISSINGSEMICOLON
        # MessageText:
        # Manifest Parse Error : A semi colon character was expected.
        :SXS_XML_E_MISSINGSEMICOLON, 14039,
        # MessageId: ERROR_SXS_XML_E_UNBALANCEDPAREN
        # MessageText:
        # Manifest Parse Error : Unbalanced parentheses.
        :SXS_XML_E_UNBALANCEDPAREN, 14040,
        # MessageId: ERROR_SXS_XML_E_INTERNALERROR
        # MessageText:
        # Manifest Parse Error : Internal error.
        :SXS_XML_E_INTERNALERROR, 14041,
        # MessageId: ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE
        # MessageText:
        # Manifest Parse Error : Whitespace is not allowed at this location.
        :SXS_XML_E_UNEXPECTED_WHITESPACE, 14042,
        # MessageId: ERROR_SXS_XML_E_INCOMPLETE_ENCODING
        # MessageText:
        # Manifest Parse Error : End of file reached in invalid state for current encoding.
        :SXS_XML_E_INCOMPLETE_ENCODING, 14043,
        # MessageId: ERROR_SXS_XML_E_MISSING_PAREN
        # MessageText:
        # Manifest Parse Error : Missing parenthesis.
        :SXS_XML_E_MISSING_PAREN, 14044,
        # MessageId: ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE
        # MessageText:
        # Manifest Parse Error : A single or double closing quote character (\' or \") is missing.
        :SXS_XML_E_EXPECTINGCLOSEQUOTE, 14045,
        # MessageId: ERROR_SXS_XML_E_MULTIPLE_COLONS
        # MessageText:
        # Manifest Parse Error : Multiple colons are not allowed in a name.
        :SXS_XML_E_MULTIPLE_COLONS, 14046,
        # MessageId: ERROR_SXS_XML_E_INVALID_DECIMAL
        # MessageText:
        # Manifest Parse Error : Invalid character for decimal digit.
        :SXS_XML_E_INVALID_DECIMAL, 14047,
        # MessageId: ERROR_SXS_XML_E_INVALID_HEXIDECIMAL
        # MessageText:
        # Manifest Parse Error : Invalid character for hexadecimal digit.
        :SXS_XML_E_INVALID_HEXIDECIMAL, 14048,
        # MessageId: ERROR_SXS_XML_E_INVALID_UNICODE
        # MessageText:
        # Manifest Parse Error : Invalid unicode character value for this platform.
        :SXS_XML_E_INVALID_UNICODE, 14049,
        # MessageId: ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK
        # MessageText:
        # Manifest Parse Error : Expecting whitespace or '?'.
        :SXS_XML_E_WHITESPACEORQUESTIONMARK, 14050,
        # MessageId: ERROR_SXS_XML_E_UNEXPECTEDENDTAG
        # MessageText:
        # Manifest Parse Error : End tag was not expected at this location.
        :SXS_XML_E_UNEXPECTEDENDTAG, 14051,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDTAG
        # MessageText:
        # Manifest Parse Error : The following tags were not closed: %1.
        :SXS_XML_E_UNCLOSEDTAG, 14052,
        # MessageId: ERROR_SXS_XML_E_DUPLICATEATTRIBUTE
        # MessageText:
        # Manifest Parse Error : Duplicate attribute.
        :SXS_XML_E_DUPLICATEATTRIBUTE, 14053,
        # MessageId: ERROR_SXS_XML_E_MULTIPLEROOTS
        # MessageText:
        # Manifest Parse Error : Only one top level element is allowed in an XML document.
        :SXS_XML_E_MULTIPLEROOTS, 14054,
        # MessageId: ERROR_SXS_XML_E_INVALIDATROOTLEVEL
        # MessageText:
        # Manifest Parse Error : Invalid at the top level of the document.
        :SXS_XML_E_INVALIDATROOTLEVEL, 14055,
        # MessageId: ERROR_SXS_XML_E_BADXMLDECL
        # MessageText:
        # Manifest Parse Error : Invalid xml declaration.
        :SXS_XML_E_BADXMLDECL, 14056,
        # MessageId: ERROR_SXS_XML_E_MISSINGROOT
        # MessageText:
        # Manifest Parse Error : XML document must have a top level element.
        :SXS_XML_E_MISSINGROOT, 14057,
        # MessageId: ERROR_SXS_XML_E_UNEXPECTEDEOF
        # MessageText:
        # Manifest Parse Error : Unexpected end of file.
        :SXS_XML_E_UNEXPECTEDEOF, 14058,
        # MessageId: ERROR_SXS_XML_E_BADPEREFINSUBSET
        # MessageText:
        # Manifest Parse Error : Parameter entities cannot be used inside markup declarations in an internal subset.
        :SXS_XML_E_BADPEREFINSUBSET, 14059,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDSTARTTAG
        # MessageText:
        # Manifest Parse Error : Element was not closed.
        :SXS_XML_E_UNCLOSEDSTARTTAG, 14060,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDENDTAG
        # MessageText:
        # Manifest Parse Error : End element was missing the character '>'.
        :SXS_XML_E_UNCLOSEDENDTAG, 14061,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDSTRING
        # MessageText:
        # Manifest Parse Error : A string literal was not closed.
        :SXS_XML_E_UNCLOSEDSTRING, 14062,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDCOMMENT
        # MessageText:
        # Manifest Parse Error : A comment was not closed.
        :SXS_XML_E_UNCLOSEDCOMMENT, 14063,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDDECL
        # MessageText:
        # Manifest Parse Error : A declaration was not closed.
        :SXS_XML_E_UNCLOSEDDECL, 14064,
        # MessageId: ERROR_SXS_XML_E_UNCLOSEDCDATA
        # MessageText:
        # Manifest Parse Error : A CDATA section was not closed.
        :SXS_XML_E_UNCLOSEDCDATA, 14065,
        # MessageId: ERROR_SXS_XML_E_RESERVEDNAMESPACE
        # MessageText:
        # Manifest Parse Error : The namespace prefix is not allowed to start with the reserved string "xml".
        :SXS_XML_E_RESERVEDNAMESPACE, 14066,
        # MessageId: ERROR_SXS_XML_E_INVALIDENCODING
        # MessageText:
        # Manifest Parse Error : System does not support the specified encoding.
        :SXS_XML_E_INVALIDENCODING, 14067,
        # MessageId: ERROR_SXS_XML_E_INVALIDSWITCH
        # MessageText:
        # Manifest Parse Error : Switch from current encoding to specified encoding not supported.
        :SXS_XML_E_INVALIDSWITCH, 14068,
        # MessageId: ERROR_SXS_XML_E_BADXMLCASE
        # MessageText:
        # Manifest Parse Error : The name 'xml' is reserved and must be lower case.
        :SXS_XML_E_BADXMLCASE, 14069,
        # MessageId: ERROR_SXS_XML_E_INVALID_STANDALONE
        # MessageText:
        # Manifest Parse Error : The standalone attribute must have the value 'yes' or 'no'.
        :SXS_XML_E_INVALID_STANDALONE, 14070,
        # MessageId: ERROR_SXS_XML_E_UNEXPECTED_STANDALONE
        # MessageText:
        # Manifest Parse Error : The standalone attribute cannot be used in external entities.
        :SXS_XML_E_UNEXPECTED_STANDALONE, 14071,
        # MessageId: ERROR_SXS_XML_E_INVALID_VERSION
        # MessageText:
        # Manifest Parse Error : Invalid version number.
        :SXS_XML_E_INVALID_VERSION, 14072,
        # MessageId: ERROR_SXS_XML_E_MISSINGEQUALS
        # MessageText:
        # Manifest Parse Error : Missing equals sign between attribute and attribute value.
        :SXS_XML_E_MISSINGEQUALS, 14073,
        # MessageId: ERROR_SXS_PROTECTION_RECOVERY_FAILED
        # MessageText:
        # Assembly Protection Error : Unable to recover the specified assembly.
        :SXS_PROTECTION_RECOVERY_FAILED, 14074,
        # MessageId: ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT
        # MessageText:
        # Assembly Protection Error : The public key for an assembly was too short to be allowed.
        :SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT, 14075,
        # MessageId: ERROR_SXS_PROTECTION_CATALOG_NOT_VALID
        # MessageText:
        # Assembly Protection Error : The catalog for an assembly is not valid, or does not match the assembly's manifest.
        :SXS_PROTECTION_CATALOG_NOT_VALID, 14076,
        # MessageId: ERROR_SXS_UNTRANSLATABLE_HRESULT
        # MessageText:
        # An HRESULT could not be translated to a corresponding Win32 error code.
        :SXS_UNTRANSLATABLE_HRESULT, 14077,
        # MessageId: ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING
        # MessageText:
        # Assembly Protection Error : The catalog for an assembly is missing.
        :SXS_PROTECTION_CATALOG_FILE_MISSING, 14078,
        # MessageId: ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE
        # MessageText:
        # The supplied assembly identity is missing one or more attributes which must be present in this context.
        :SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE, 14079,
        # MessageId: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME
        # MessageText:
        # The supplied assembly identity has one or more attribute names that contain characters not permitted in XML names.
        :SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME, 14080,
        # MessageId: ERROR_SXS_ASSEMBLY_MISSING
        # MessageText:
        # The referenced assembly could not be found.
        :SXS_ASSEMBLY_MISSING, 14081,
        # MessageId: ERROR_SXS_CORRUPT_ACTIVATION_STACK
        # MessageText:
        # The activation context activation stack for the running thread of execution is corrupt.
        :SXS_CORRUPT_ACTIVATION_STACK, 14082,
        # MessageId: ERROR_SXS_CORRUPTION
        # MessageText:
        # The application isolation metadata for this process or thread has become corrupt.
        :SXS_CORRUPTION, 14083,
        # MessageId: ERROR_SXS_EARLY_DEACTIVATION
        # MessageText:
        # The activation context being deactivated is not the most recently activated one.
        :SXS_EARLY_DEACTIVATION, 14084,
        # MessageId: ERROR_SXS_INVALID_DEACTIVATION
        # MessageText:
        # The activation context being deactivated is not active for the current thread of execution.
        :SXS_INVALID_DEACTIVATION, 14085,
        # MessageId: ERROR_SXS_MULTIPLE_DEACTIVATION
        # MessageText:
        # The activation context being deactivated has already been deactivated.
        :SXS_MULTIPLE_DEACTIVATION, 14086,
        # MessageId: ERROR_SXS_PROCESS_TERMINATION_REQUESTED
        # MessageText:
        # A component used by the isolation facility has requested to terminate the process.
        :SXS_PROCESS_TERMINATION_REQUESTED, 14087,
        # MessageId: ERROR_SXS_RELEASE_ACTIVATION_CONTEXT
        # MessageText:
        # A kernel mode component is releasing a reference on an activation context.
        :SXS_RELEASE_ACTIVATION_CONTEXT, 14088,
        # MessageId: ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY
        # MessageText:
        # The activation context of system default assembly could not be generated.
        :SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY, 14089,
        # MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE
        # MessageText:
        # The value of an attribute in an identity is not within the legal range.
        :SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE, 14090,
        # MessageId: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME
        # MessageText:
        # The name of an attribute in an identity is not within the legal range.
        :SXS_INVALID_IDENTITY_ATTRIBUTE_NAME, 14091,
        # MessageId: ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE
        # MessageText:
        # An identity contains two definitions for the same attribute.
        :SXS_IDENTITY_DUPLICATE_ATTRIBUTE, 14092,
        # MessageId: ERROR_SXS_IDENTITY_PARSE_ERROR
        # MessageText:
        # The identity string is malformed. This may be due to a trailing comma, more than two unnamed attributes,
        # missing attribute name or missing attribute value.
        :SXS_IDENTITY_PARSE_ERROR, 14093,
        # MessageId: ERROR_MALFORMED_SUBSTITUTION_STRING
        # MessageText:
        # A string containing localized substitutable content was malformed. Either a dollar sign ($) was followed by
        # something other than a left parenthesis or another dollar sign or an substitution's right parenthesis was not
        # found.
        :MALFORMED_SUBSTITUTION_STRING, 14094,
        # MessageId: ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN
        # MessageText:
        # The public key token does not correspond to the public key specified.
        :SXS_INCORRECT_PUBLIC_KEY_TOKEN, 14095,
        # MessageId: ERROR_UNMAPPED_SUBSTITUTION_STRING
        # MessageText:
        # A substitution string had no mapping.
        :UNMAPPED_SUBSTITUTION_STRING, 14096,
        # MessageId: ERROR_SXS_ASSEMBLY_NOT_LOCKED
        # MessageText:
        # The component must be locked before making the request.
        :SXS_ASSEMBLY_NOT_LOCKED, 14097,
        # MessageId: ERROR_SXS_COMPONENT_STORE_CORRUPT
        # MessageText:
        # The component store has been corrupted.
        :SXS_COMPONENT_STORE_CORRUPT, 14098,
        # MessageId: ERROR_ADVANCED_INSTALLER_FAILED
        # MessageText:
        # An advanced installer failed during setup or servicing.
        :ADVANCED_INSTALLER_FAILED, 14099,
        # MessageId: ERROR_XML_ENCODING_MISMATCH
        # MessageText:
        # The character encoding in the XML declaration did not match the encoding used in the document.
        :XML_ENCODING_MISMATCH, 14100,
        # MessageId: ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT
        # MessageText:
        # The identities of the manifests are identical but their contents are different.
        :SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT, 14101,
        # MessageId: ERROR_SXS_IDENTITIES_DIFFERENT
        # MessageText:
        # The component identities are different.
        :SXS_IDENTITIES_DIFFERENT, 14102,
        # MessageId: ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT
        # MessageText:
        # The assembly is not a deployment.
        :SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT, 14103,
        # MessageId: ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY
        # MessageText:
        # The file is not a part of the assembly.
        :SXS_FILE_NOT_PART_OF_ASSEMBLY, 14104,
        # MessageId: ERROR_SXS_MANIFEST_TOO_BIG
        # MessageText:
        # The size of the manifest exceeds the maximum allowed.
        :SXS_MANIFEST_TOO_BIG, 14105,
        # MessageId: ERROR_SXS_SETTING_NOT_REGISTERED
        # MessageText:
        # The setting is not registered.
        :SXS_SETTING_NOT_REGISTERED, 14106,
        # MessageId: ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE
        # MessageText:
        # One or more required members of the transaction are not present.
        :SXS_TRANSACTION_CLOSURE_INCOMPLETE, 14107,
        # MessageId: ERROR_SMI_PRIMITIVE_INSTALLER_FAILED
        # MessageText:
        # The SMI primitive installer failed during setup or servicing.
        :SMI_PRIMITIVE_INSTALLER_FAILED, 14108,
        # MessageId: ERROR_GENERIC_COMMAND_FAILED
        # MessageText:
        # A generic command executable returned a result that indicates failure.
        :GENERIC_COMMAND_FAILED, 14109,
        # MessageId: ERROR_SXS_FILE_HASH_MISSING
        # MessageText:
        # A component is missing file verification information in its manifest.
        :SXS_FILE_HASH_MISSING, 14110,
        #=== End of Side By Side Error Codes 14000 to 14999 ===#
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end