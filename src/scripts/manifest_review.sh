sed '/\s{8}android:label=.*$/\s{8}android:label=\"'"${PARAM_APPNAME}"'\"' "${PARAM_APPPPATH}/android/app/src/main/AndroidManifest.xml"

