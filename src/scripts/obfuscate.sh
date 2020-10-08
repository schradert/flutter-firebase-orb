# Defining script arguments
args=(--obfuscate)
if [${PARAM_MINIMIZE}]; then
    args+=(--no-shrink)
fi
args+=(--split-debug-info="/${PARAM_PROJNAME}/${PARAM_DIRNAME}")

for DIST in "ios" "apk"
do
    flutter build "${DIST}" "${args[@]}"
done