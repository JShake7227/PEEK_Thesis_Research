
# Create LAMMPS input files this way:

cd moltemplate_files

  # run moltemplate

  # This was the original (simple) way to run moltemplate:
  # moltemplate.sh  system.lt  <-- COMMENTING OUT
  # Instead, this is the recommended way to run moltemplate with OPLSAA:

  moltemplate.sh -atomstyle full -checkff system.lt

  # (The optional "-report-duplicates bytype __" arguments check to make
  #  sure that there was no ambiguity in the dihedrals that were generated.
  #  This is an issue with OPLSAA.  If there was, then moltemplate will create
  #  a file named "warning_duplicate_dihedrals.txt".)
  #
  # (Note: You can also check for missing angle,dihedral params this way:)
  # moltemplate.sh -checkff system.lt 

  
  # Moltemplate generates various files with names ending in *.in* and *.data.
  # Move them to the directory where you plan to run LAMMPS (in this case "../")
  mv -f system.data ../
  mv -f system.in* ../

  # Optional:
  # The "./output_ttree/" directory is full of temporary files generated by
  # moltemplate.  They can be useful for debugging, but are usually thrown away.
  rm -rf output_ttree/

  # Optional:
  rm -f run.in.EXAMPLE  # not needed.  We have several run.in... files already.

  # Optional:
  # If any warnings were generated, move them to the parent folder
  # (so they get noticed).
  mv -f warning*.txt ../ 2> /dev/null

 cd ../

# Optional:
# Note: The system.data and system.in.settings files contain extra information
# for atoms defined in OPLSAA which you are not using in this simulation.
# This is harmless, but if you to delete this information from your
# system.in.settings and system.in.data files, run this script:
#
cleanup_moltemplate.sh
