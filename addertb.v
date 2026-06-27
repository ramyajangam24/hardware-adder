`include "adder.v"
module tb;
reg clk,res;
reg [35:0]a,b;
reg cin;
wire [35:0]s;
wire co;
wire [36:0]s1;
add dut(.clk(clk),.res(res),.a(a),.b(b),.cin(cin),.s(s),.co(co),.s1(s1));
always #5 clk=~clk;
initial begin
clk=0;
res=1;
repeat(2)@(posedge clk);
res=0;
repeat(10)begin
@(negedge clk);
a={$random,{$random}%4};
b={$random,{$random}%4};
cin=$random%2;
@(posedge clk);
#1;

$display("a=%0d,b=,%0d,cin=,%0d,sum=,%0d,co=,%0d,s1=,%0d",a,b,cin,s,co,dut.s1);
//$strobe prints at the end of time step
end
$stop;
end
endmodule
