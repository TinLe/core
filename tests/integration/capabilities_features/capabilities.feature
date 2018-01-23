Feature: capabilities
	Background:
		Given using api version "1"
		And as an "admin"

	Scenario: Check that the sharing API can be enabled
		When the administrator sets parameter "shareapi_enabled" of app "core" to "yes" using the API
		Then the capabilities setting of "files_sharing" path "api_enabled" should be "1"

	Scenario: Check that the sharing API can be disabled
		When the administrator sets parameter "shareapi_enabled" of app "core" to "no" using the API
		Then the capabilities setting of "files_sharing" path "api_enabled" should be ""

	Scenario: Check that group sharing can be enabled
		When the administrator sets parameter "shareapi_allow_group_sharing" of app "core" to "yes" using the API
		Then the capabilities setting of "files_sharing" path "group_sharing" should be "1"

	Scenario: Check that group sharing can be disabled
		When the administrator sets parameter "shareapi_allow_group_sharing" of app "core" to "no" using the API
		Then the capabilities setting of "files_sharing" path "group_sharing" should be ""

	Scenario: getting capabilities with admin user
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing public upload
		Given parameter "shareapi_allow_public_upload" of app "core" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | EMPTY |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Disabling share api
		Given parameter "shareapi_enabled" of app "core" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | EMPTY |
			| files_sharing | public@@@enabled | EMPTY |
			| files_sharing | public@@@upload | EMPTY |
			| files_sharing | resharing | EMPTY |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Disabling public links
		Given parameter "shareapi_allow_links" of app "core" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | EMPTY |
			| files_sharing | public@@@upload | EMPTY |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing resharing
		Given parameter "shareapi_allow_resharing" of app "core" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | EMPTY |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing federation outgoing
		Given parameter "outgoing_server2server_share_enabled" of app "files_sharing" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | EMPTY |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing federation incoming
		Given parameter "incoming_server2server_share_enabled" of app "files_sharing" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | EMPTY |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing password enforce
		Given parameter "shareapi_enforce_links_password" of app "core" has been set to "yes"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | public@@@password@@@enforced | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing public notifications
		Given parameter "shareapi_allow_public_notification" of app "core" has been set to "yes"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | 1 |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing public social share
		Given parameter "shareapi_allow_social_share" of app "core" has been set to "no"
		When sending "GET" to "/cloud/capabilities"
		Then the HTTP status code should be "200"
		And fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | EMPTY |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing expire date
		Given parameter "shareapi_default_expire_date" of app "core" has been set to "yes"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | public@@@expire_date@@@enabled | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing expire date enforcing
		Given parameter "shareapi_default_expire_date" of app "core" has been set to "yes"
		And parameter "shareapi_enforce_expire_date" of app "core" has been set to "yes"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | public@@@expire_date@@@enabled | 1 |
			| files_sharing | public@@@expire_date@@@enforced | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing group sharing allowed
		Given parameter "shareapi_allow_group_sharing" of app "core" has been set to "no"
		When the capabilities are retrieved
		Then fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | EMPTY |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing only share with group member
		Given parameter "shareapi_only_share_with_group_members" of app "core" has been set to "yes"
		When sending "GET" to "/cloud/capabilities"
		Then the HTTP status code should be "200"
		And fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | 1 |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing allow share dialog user enumeration
		Given parameter "shareapi_allow_share_dialog_user_enumeration" of app "core" has been set to "no"
		When sending "GET" to "/cloud/capabilities"
		Then the HTTP status code should be "200"
		And fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | EMPTY |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |

	Scenario: Changing allow share dialog user enumeration for group members only
		Given parameter "shareapi_share_dialog_user_enumeration_group_members" of app "core" has been set to "yes"
		When sending "GET" to "/cloud/capabilities"
		Then the HTTP status code should be "200"
		And fields of capabilities match with
			| capability | path_to_element | value |
			| core | pollinterval | 60 |
			| core | webdav-root | remote.php/webdav |
			| files_sharing | api_enabled | 1 |
			| files_sharing | public@@@enabled | 1 |
			| files_sharing | public@@@upload | 1 |
			| files_sharing | public@@@send_mail | EMPTY |
			| files_sharing | public@@@social_share | 1 |
			| files_sharing | resharing | 1 |
			| files_sharing | federation@@@outgoing | 1 |
			| files_sharing | federation@@@incoming | 1 |
			| files_sharing | group_sharing         | 1 |
			| files_sharing | share_with_group_members_only | EMPTY |
			| files_sharing | user_enumeration@@@enabled | 1 |
			| files_sharing | user_enumeration@@@group_members_only | 1 |
			| files | bigfilechunking | 1 |
			| files | undelete | 1 |
			| files | versioning | 1 |
