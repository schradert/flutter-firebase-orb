keygen_args=(
    -genkey
    -noprompt
    -alias key
    -dname "CN=${PARAM_COMPLETENAME}, OU=${PARAM_ORGUNIT}, O=${PARAM_ORGNAME}, L=${PARAM_LOCALITY}, ST=${PARAM_STATE}, C=${PARAM_COUNTRYCODE}"
    -keystore "${PARAM_KEYPATH}"
    -keyalg RSA
    -keysize 2048
    -validity 10000
    -storepass "${PARAM_PASS}"
    -keypass "${PARAM_PASS}"
)
if [${PARAM_VERBOSE}]; then
    keygen_args+=(-v)
fi

keytool "${keygen_args[@]}"
echo "${PARAM_KEYPATH}" >> "${PARAM_APPPATH}/.gitignore"
echo -e "
storePassword=${PARAM_PASS}
keyPassword=${PARAM_PASS}
keyAlias=key
storeFile=${PARAM_KEYPATH}
" > "${PARAM_APPPATH}/android/key.properties"

sed -i '/^android {$/e cat android.txt' "${PARAM_APPPATH}/android/app/build.gradle"
sed -i '/^buildTypes {$/e cat buildtypes.txt' "${PARAM_APPPATH}/android/app/build.gradle"

flutter clean