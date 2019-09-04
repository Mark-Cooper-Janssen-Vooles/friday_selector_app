arr_of_places = [1, 2, 3]

def get_all_wheelchair(arr)
    # do some stuff
    return 1
end

begin
    result = get_all_wheelchair(arr_of_places)
    if result.class != Array
        raise("not the correct class, should be array")
    end
rescue => error
    p error
end

