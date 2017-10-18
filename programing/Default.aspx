<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Student_id"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="name "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Class_id"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ado_TestConnectionString %>"
            SelectCommand="SELECT DISTINCT id, memo, classid, name FROM info" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    
    </div>
        &nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            Height="145px">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="classid" HeaderText="classid" SortExpression="classid" />
                <asp:BoundField DataField="memo" HeaderText="memo" SortExpression="memo" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        &nbsp;
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Test1" />
        <asp:Button ID="Button2" runat="server" Text="Test2" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Test3" />
    </form>
</body>
</html>
