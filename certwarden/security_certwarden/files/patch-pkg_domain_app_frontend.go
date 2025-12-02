--- pkg/domain/app/frontend.go.orig	2025-11-30 00:45:50 UTC
+++ pkg/domain/app/frontend.go
@@ -13,7 +13,7 @@ import (
 	"time"
 )
 
-const frontendBuildDir = "./frontend_build"
+const frontendBuildDir = "%%WWWDIR%%"
 const frontendEnvFile = frontendBuildDir + "/env.js"
 
 // noncePlaceholder is the text to use in frontend to show server where to inject nonce
