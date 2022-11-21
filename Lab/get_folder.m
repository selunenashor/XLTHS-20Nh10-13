%get sub folder
function folder=get_folder(path)
    file=dir(path);
    folder={file(3:end).name};
end


