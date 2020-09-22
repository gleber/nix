mkdir $out
echo $(cat $input0/bar) > $out/foobar

# Self-reference.
ln -s $out $out/self

# Executable.
echo program > $out/program
chmod +x $out/program

echo FOO
