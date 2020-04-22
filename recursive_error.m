function final = recursive_error(bound,param)

des_error = param{1};

[err,planes] = abstract(bound,param); % Linear program for Affine Abstraction in Theorem 1

if(err>des_error)
    
    sub_bounds = divide_bound(bound);
    
    cell_1 = recursive_error(sub_bounds{1},param);
    cell_2 = recursive_error(sub_bounds{2},param);
    cell_3 = recursive_error(sub_bounds{3},param);
    cell_4 = recursive_error(sub_bounds{4},param);
    
    s_1 = size(cell_1,1);
    s_2 = size(cell_2,1);
    s_3 = size(cell_3,1);
    s_4 = size(cell_4,1);
    
    size_f = s_1+s_2+s_3+s_4;
    
    final = cell(size_f,1);
    k = 1;
    
    for i = 1:s_1
        final{k,1} = cell_1{i,1};
        k = k+1;
    end
    for i = 1:s_2
        final{k,1} = cell_2{i,1};
        k = k+1;
    end
    for i = 1:s_3
        final{k,1} = cell_3{i,1};
        k = k+1;
    end
    for i = 1:s_4
        final{k,1} = cell_4{i,1};
        k = k+1;
    end
    
else
    final = cell(1);
    final{1,1} = planes;
end

end