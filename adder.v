module add(clk,res,a,b,cin,s,co,s1);
input [35:0]a;//9 digits(9*4=36)
input [35:0]b;
input cin;
input clk,res;
integer i;
output reg [35:0]s;
output reg co;
reg [35:0]temp_sum;
output wire [36:0]s1;
reg [36:0]c;
assign s1={c[36],temp_sum};
always@(posedge clk)begin
if(res)begin
s<=36'b0;
co<=0;
end
else begin
c[0]=cin;
for(i=0;i<36;i=i+1)begin
temp_sum[i]=a[i]^b[i]^c[i];
c[i+1]=(a[i]&b[i])|(c[i]&(a[i]^b[i]));
end
s<=temp_sum;
co<=c[36];
end
end
endmodule
