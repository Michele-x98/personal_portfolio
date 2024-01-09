# copy all the content of the build/web folder into the github.io folder
cp -r build/web/* /Users/michelebenedetti/Documents/Lavoro/Michele-x98.github.io
cd /Users/michelebenedetti/Documents/Lavoro/Michele-x98.github.io
git add .
git commit -m "deploy"
git push
echo "Deployed successfully!"
# open michelebenediti.it
open http://michelebenedetti.it
