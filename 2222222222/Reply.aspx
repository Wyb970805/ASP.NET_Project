<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="_2222222222.Reply1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvReply" BorderStyle="None" GridLines="None" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                <Columns>
                    <asp:TemplateField HeaderText="UserID">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server" Font-Bold="true" ForeColor="#af3456" Text='<%# Bind("userID") %>'></asp:Label>
                            <br />
                            <asp:Label ID="lblReplyDate" runat="server" Text='<%# Bind("replyDate") %>'></asp:Label>
                            <br />
                            <asp:Label ID="lblRelyContent" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
