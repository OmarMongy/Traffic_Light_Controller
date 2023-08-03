module Traffic_Light_Controller_tb();

reg clk, reset_n;
reg Sa, Sb;
wire Ra, Rb, Ya, Yb, Ga, Gb;

Traffic_Light_Controller uut (
    .clk(clk),
    .reset_n(reset_n),
    .Sa(Sa),
    .Sb(Sb),
    .Ra(Ra),
    .Rb(Rb),
    .Ya(Ya),
    .Yb(Yb),
    .Ga(Ga),
    .Gb(Gb)
);

localparam T = 10;

always
begin
    clk = 1'b0;
    #(T/2)
    clk = 1'b1;
    #(T/2);
end

initial 
begin
    reset_n = 1'b0;
    #T
    reset_n = 1'b1;
    Sa = 1'b0;
    Sb = 1'b0;
    #(6*T)
    Sa = 1'b0;
    Sb = 1'b1;
    #(8*T)
    Sa = 1'b1;
    Sb = 1'b1;
    #(6*T)
    Sa = 1'b0;
    Sb = 1'b1;
    #(6*T)
    Sa = 1'b0;
    Sb = 1'b0;
    #(6*T)
    Sa = 1'b1;
    Sb = 1'b1;
    #(30*T)
    Sa = 1'b0;
    Sb = 1'b0;
    #(15*T)
    $stop;
end
endmodule
