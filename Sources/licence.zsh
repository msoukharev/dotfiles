# Call to generate licence
# Available licences are stored in $DOTFILE_PATH/Data/Templates/Licence
function licence() {

    licence_loc=${DOTFILE_PATH}/Data/Templates/Licence
    usage_msg="Type -h, --help or help to display help message\n\
    Usage:                  licence <licence_type> [-y year] [-o holder] [-p program]\n\
    Licence types:          apache-2, gnu-gpl-3, mit, mozilla-pl-2"

    case $1 in
    "apache-2" | "gnu-gpl-3" | "mit" | "mozilla-pl-2")
    licence=$1
    shift
    ;;
    "-h" | "--help" | "help")
    echo -e $usage_msg
    return 0
    ;;
    *)
    echo -e $usage_msg
    return 1
    ;;
    esac
    
    year=$(date +"%Y")
    holder=$USER
    program=$(basename $PWD)
    
    flags=("-y" "-o" "-p")

    if [[ ($1 == "-y") && (-n ${2}) ]] ; then
        if __isin $2 $flags; then
            echo -e $usage_msg
            return 1
        else
            year=$2
            shift 2
        fi
    fi

    if [[ ($1 == "-o") && (-n ${2}) ]]; then
        if __isin $2 $flags; then
            echo -e $usage_msg
            return 1
        else
            holder=$2
            shift 2
        fi
    fi

    if [[ ($1 == "-p") && (-n ${2}) ]]; then
        if __isin $2 $flags; then
            echo -e $usage_msg
            return 1
        else
            owner=$2
            shift 2
        fi
    fi
    
    pwd_files=(`ls $PWD`)
    if __isin "LICENCE" $pwd_files || __isin "Licence" $pwd_files; then
        __yesno "Directroy already contains licence. Do you wish to overwrite?" || echo "Abort."; return 1
    fi
    cat ${licence_loc}/${licence} | sed "s/<year>/$year/g;s/<holder>/$holder/g;s/<program>/$program/g" > $PWD/LICENCE
    return 0

}
