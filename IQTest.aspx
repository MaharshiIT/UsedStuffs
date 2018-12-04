<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="IQTest.aspx.cs" Inherits="IQTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    var m = 14;
    var s = 60;
    var t;
    function time() {
        t = setInterval(function () { timer(); }, 1000);
    }
    
    function timer() {
        if (m > 0) {
            if (s > 0) {
                s--;

            }
            else {
                s = 60;
                m--;

            }
            if (m < 10) {
                document.getElementById("ContentPlaceHolder1_lblMin").innerHTML = "0" + m+" : ";
            }
            else {
                document.getElementById("ContentPlaceHolder1_lblMin").innerHTML = m+" : ";
            }
            if (s < 10) {
                document.getElementById("ContentPlaceHolder1_lblSec").innerHTML = "0" + s;
            }
            else {
                document.getElementById("ContentPlaceHolder1_lblSec").innerHTML = s;
            }


        }
        else {
            document.getElementById("ContentPlaceHolder1_lblMin").innerHTML = "00 : ";
            if (s > 0) {
                s--;
                if (s < 10) {
                    document.getElementById("ContentPlaceHolder1_lblSec").innerHTML = "0" + s;
                }
                else
                    document.getElementById("ContentPlaceHolder1_lblSec").innerHTML = s;
            }
            else {
                clearInterval(t);
                alert("Time up!")
                document.getElementById("ContentPlaceHolder1_btnSubmit").click();
            }

        }

    }
</script>
<form id="Form1" runat="server">
<div style="background-color:Yellow;">
<div align="center" style="font-size:large; font-weight:bold">IQ Test</div>
<div align="center" id="res" runat="server" style="font-size:large; font-weight:bold">Test Result</div>
<div align="right">
<table border="0">
<tr>
<td><asp:Label ID="lblMin" Font-Size="Medium" Font-Bold="true" runat="server"></asp:Label></td>
<td><asp:Label ID="lblSec" Font-Size="Medium" Font-Bold="true" runat="server"></asp:Label></td>
</tr>
</table>
</div>
<table border="0">
<tr><td><asp:Image ID="c1" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w1" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">1. If you rearrange the letters "BABRIT", you would have the name of a:</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb11" runat="server" GroupName="q1" Text="Ocean" />
<asp:RadioButton ID="rb21" runat="server" GroupName="q1" Text="Country" />
<asp:RadioButton ID="rb31" runat="server" GroupName="q1" Text="State" />
<asp:RadioButton ID="rb41" runat="server" GroupName="q1" Text="Animal" />
<asp:Label ID="lbl1" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c2" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w2" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">2. Chhagan, twelve years old, is three times as old as his brother. How old will Chhagan be when he is twice as old as his brother?</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb12" runat="server" GroupName="q2" Text="15" />
<asp:RadioButton ID="rb22" runat="server" GroupName="q2" Text="16" />
<asp:RadioButton ID="rb32" runat="server" GroupName="q2" Text="18" />
<asp:RadioButton ID="rb42" runat="server" GroupName="q2" Text="20" />
<asp:Label ID="lbl2" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c3" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w3" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">3. Which one of the numbers does not belong in the following series? 10 - 8 - 9 - 7 - 8 - 6 - 7 - 4</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb13" runat="server" GroupName="q3" Text="10" />
<asp:RadioButton ID="rb23" runat="server" GroupName="q3" Text="8" />
<asp:RadioButton ID="rb33" runat="server" GroupName="q3" Text="6" />
<asp:RadioButton ID="rb43" runat="server" GroupName="q3" Text="4" />
<asp:Label ID="lbl3" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c4" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w4" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">4. Rakesh is taller than Ramesh, and Brijesh is shorter than Rakesh.Which of the following statements would be most accurate?
(A) Brijesh is taller than Ramesh.
(B) Brijesh is shorter than Ramesh.
(C) Brijesh is as tall as Ramesh.
(D) It is impossible to tell whether Brijesh or Ramesh is taller.</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb14" runat="server" GroupName="q4" Text="A" />
<asp:RadioButton ID="rb24" runat="server" GroupName="q4" Text="B" />
<asp:RadioButton ID="rb34" runat="server" GroupName="q4" Text="C" />
<asp:RadioButton ID="rb44" runat="server" GroupName="q4" Text="D" />
<asp:Label ID="lbl4" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c5" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w5" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">5. The price of an article was cut 20% for a sale. By what percent must the item be increased to again sell the article at the original price?</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb15" runat="server" GroupName="q5" Text="15%" />
<asp:RadioButton ID="rb25" runat="server" GroupName="q5" Text="20%" />
<asp:RadioButton ID="rb35" runat="server" GroupName="q5" Text="25%" />
<asp:RadioButton ID="rb45" runat="server" GroupName="q5" Text="30%" />
<asp:Label ID="lbl5" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c6" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w6" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">6. Sara had a number of chocolates. After eating one, she gave half the remaining to her sister. After eating another chocolate, she gave half of what was left to her brother. Sara now had only five chocolates left. How many chocolates did she start with?
11 - 22 - 23 - 45 - 46</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb16" runat="server" GroupName="q6" Text="11" />
<asp:RadioButton ID="rb26" runat="server" GroupName="q6" Text="22" />
<asp:RadioButton ID="rb36" runat="server" GroupName="q6" Text="23" />
<asp:RadioButton ID="rb46" runat="server" GroupName="q6" Text="45" />
<asp:Label ID="lbl6" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c7" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w7" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">7. Which one of the numbers does not belong in the following series? 3 - 4 - 8 - 10 - 18 - 19 - 38 </p>
<p style="font-size:medium">
<asp:RadioButton ID="rb17" runat="server" GroupName="q7" Text="3" />
<asp:RadioButton ID="rb27" runat="server" GroupName="q7" Text="8" />
<asp:RadioButton ID="rb37" runat="server" GroupName="q7" Text="10" />
<asp:RadioButton ID="rb47" runat="server" GroupName="q7" Text="19" />
<asp:Label ID="lbl7" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c8" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w8" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">8. "A spaceship received three messages in a strange language from a distant planet. The astonauts studied these messages and found
that "Elros Aldarion Elendil" means "Danger Helicopter Explosion" and "Edain Mnyatur Elros" means "Danger Ship Fire" and "Aldarion
Gimilzor Gondor" means "Bad Car Explosion". What does "Elendil" mean? </p>
<p style="font-size:medium">
<asp:RadioButton ID="rb18" runat="server" GroupName="q8" Text="Danger" />
<asp:RadioButton ID="rb28" runat="server" GroupName="q8" Text="Explosion" />
<asp:RadioButton ID="rb38" runat="server" GroupName="q8" Text="Ship" />
<asp:RadioButton ID="rb48" runat="server" GroupName="q8" Text="Helicopter" />
<asp:Label ID="lbl8" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c9" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w9" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">9. Arjun was both 13th highest and 13th lowest in a Quiz contest. How many people were in the contest? </p>
<p style="font-size:medium">
<asp:RadioButton ID="rb19" runat="server" GroupName="q9" Text="13" />
<asp:RadioButton ID="rb29" runat="server" GroupName="q9" Text="25" />
<asp:RadioButton ID="rb39" runat="server" GroupName="q9" Text="26" />
<asp:RadioButton ID="rb49" runat="server" GroupName="q9" Text="27" />
<asp:Label ID="lbl9" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c10" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w10" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">10. Which one of the four is least like the other three?</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb110" runat="server" GroupName="q10" Text="Acre" />
<asp:RadioButton ID="rb210" runat="server" GroupName="q10" Text="Foot" />
<asp:RadioButton ID="rb310" runat="server" GroupName="q10" Text="Mile" />
<asp:RadioButton ID="rb410" runat="server" GroupName="q10" Text="Yard" />
<asp:Label ID="lbl10" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c11" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w11" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">11. Which one of the four makes the best comparison? Bullet is to gun as ball is to:</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb111" runat="server" GroupName="q11" Text="Bat" />
<asp:RadioButton ID="rb211" runat="server" GroupName="q11" Text="Cannon" />
<asp:RadioButton ID="rb311" runat="server" GroupName="q11" Text="Pitcher" />
<asp:RadioButton ID="rb411" runat="server" GroupName="q11" Text="Catapult" />
<asp:Label ID="lbl11" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c12" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w12" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">12. Which one of the four makes the best comparison? Tree is to ground as chimney is to:</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb112" runat="server" GroupName="q12" Text="Smoke" />
<asp:RadioButton ID="rb212" runat="server" GroupName="q12" Text="Brick" />
<asp:RadioButton ID="rb312" runat="server" GroupName="q12" Text="Sky" />
<asp:RadioButton ID="rb412" runat="server" GroupName="q12" Text="House" />
<asp:Label ID="lbl12" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c13" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w13" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">13. Which one of the four letters is least like the other three?</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb113" runat="server" GroupName="q13" Text="F" />
<asp:RadioButton ID="rb213" runat="server" GroupName="q13" Text="Z" />
<asp:RadioButton ID="rb313" runat="server" GroupName="q13" Text="N" />
<asp:RadioButton ID="rb413" runat="server" GroupName="q13" Text="E" />
<asp:Label ID="lbl13" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c14" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w14" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">14. Which one of the four makes the best comparison? DBBDDBD is to 4224424 as CACAACAC is to:</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb114" runat="server" GroupName="q14" Text="31311313" />
<asp:RadioButton ID="rb214" runat="server" GroupName="q14" Text="31311131" />
<asp:RadioButton ID="rb314" runat="server" GroupName="q14" Text="13133313" />
<asp:RadioButton ID="rb414" runat="server" GroupName="q14" Text="13133131" />
<asp:Label ID="lbl14" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr><td><asp:Image ID="c15" runat="server" ImageUrl="~/images/correct.png" Visible="false" /><asp:Image ID="w15" runat="server" ImageUrl="~/images/wrong.png" Visible="false" /></td>
<td>
<p style="font-size:medium">15. Joy's mother sent him to the store to get 9 large cans of milk. John could only carry 2 cans at a time. How many trips to the store did Joy have to make?</p>
<p style="font-size:medium">
<asp:RadioButton ID="rb115" runat="server" GroupName="q15" Text="4" />
<asp:RadioButton ID="rb215" runat="server" GroupName="q15" Text="4.5" />
<asp:RadioButton ID="rb315" runat="server" GroupName="q15" Text="5" />
<asp:RadioButton ID="rb415" runat="server" GroupName="q15" Text="6" />
<asp:Label ID="lbl15" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
</p>
</td>
</tr>
<tr>
<td></td>
<td align="right"><asp:Button ID="btnSubmit" runat="server" Text="Submit Test" OnClick="submit_click" PostBackUrl="~/IQTest"/></td>
</table>
<div style="color:Purple; font-size:large; font-weight:bold" id="score" runat="server"></div> 
</div>
</form>
</asp:Content>

