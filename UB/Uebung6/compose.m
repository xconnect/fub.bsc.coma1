function c=compose(f,g)

    compose = @(g,f)@(x)g(f(x));
    c = compose(g,f);
    
    
end