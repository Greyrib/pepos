# Start a new README
echo "# Project Title" > README.md
echo "" >> README.md
echo "## Files in Subfolder" >> README.md
echo "" >> README.md

# Loop through files in subfolder "subfolder/"
for file in Pepo_Imageryiés/*; do
if [ -f "$file" ];then
filename=$(basename "$file")
echo "-$filename" >> README.md
fi
done

chmod +x GrabPepos.sh
./GrabPepos.sh