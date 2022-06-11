#!/bin/bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -in)
      FASTA_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -out)
      BLAST_DB_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

echo "Fasta file from ${FASTA_DIR}"
echo "Make Blast database at ${BLAST_DB_DIR}"

declare -a FASTA_ARR
FASTA_ARR=$(ls ${FASTA_DIR}/*.fa)

#echo ${FASTA_ARR[@]} 
echo ${BLAST_DB_DIR}/${f}.pdb
echo ${FASTA_DIR}/${f}
echo $f

for f in ${FASTA_ARR[@]}; do
  if [[ ! -f ${BLAST_DB_DIR}/$(basename ${f} .fa).pdb ]]; then
    echo ${BLAST_DB_DIR}/$(basename ${f} .fa).pdb
    
    makeblastdb \
    -dbtype prot \
    -in ${f} \
    -parse_seqids \
    -hash_index \
    -out ${BLAST_DB_DIR}/$(basename ${f} .fa)
  else
    echo "${f} already exists"
  fi
done
