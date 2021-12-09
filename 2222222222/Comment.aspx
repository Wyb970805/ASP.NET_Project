<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="_2222222222.Comment1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/error.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Comment</h2>
            <div class="container" style="padding: 15px 20px; width: auto;">
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="txtContent" runat="server" Height="100px" TextMode="MultiLine" Width="500px" MaxLength="800" Rows="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please give a comment" Display="Dynamic" ControlToValidate="txtContent" CssClass="error" ValidationGroup="groupComment"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button ID="btnComment" runat="server" Text="Post Comment" class="btn btn-sm btn-dark" OnClick="btnComment_Click" ValidationGroup="groupComment" />
                <div class="col-md-6"></div>
            </div>

            <h3>Comments:</h3>

            <asp:GridView ID="gvComment" runat="server" AutoGenerateColumns="False" BorderStyle="None" GridLines="None" ShowHeader="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="commentID" HeaderText="commentID" Visible="False" />
                    <asp:TemplateField HeaderText="Content">
                        <ItemTemplate>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <table>
                                            <tr>
                                                <td style="width: 800px; vertical-align: top; padding-top: 10px">
                                                    <asp:Label ID="lblUserID" Font-Bold="true" runat="server" Font-Italic="True" Font-Size="Large" Text='<%# Bind("userID") %>'></asp:Label>
                                                    <asp:Label ID="lblCommentDate" runat="server" Text='<%# Bind("commentDate") %>'></asp:Label>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>

                                                    <asp:Label ID="lblContent" runat="server" Font-Size="Large" Text='<%# Bind("content") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("commentID") %>'></asp:Label>

                                                    <a id='lnkReplyParent<%#Eval("commentID") %>' href="javascript:void(0)" onclick="showReply(<%#Eval("commentID") %>);return false;">Reply</a>
                                                    <a id="lnkCancle" href="javascript:void(0)" onclick="closeReply(<%#Eval("commentID") %>);return false;">Cancle</a>

                                                    <div id='divReply<%#Eval("commentID") %>' style="display: none; margin-top: 5px;">
                                                        <asp:TextBox ID="txtReply" runat="server" Height="80px" Width="300px" TextMode="MultiLine" MaxLength="800" Rows="15"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please reply on this comment" CssClass="error" ControlToValidate="txtReply" Display="Dynamic" ValidationGroup="groupReply"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:Button ID="btnReply" runat="server" class="btn btn-sm btn-dark" Text="Reply" ValidationGroup="groupReply" OnClick="btnReply_Click" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 100px; border-bottom: 1px solid #000000;">
                                                    <br />
                                                    <asp:GridView ID="gvReply" BorderStyle="None" GridLines="None" runat="server" AutoGenerateColumns="False" ShowHeader="False">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="UserID">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReplyDate" runat="server" Text='<%# Bind("replyDate") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblUserID" runat="server" Font-Bold="true" ForeColor="#ff0066" Text='<%# Bind("userID") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblRelyContent" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                                                                    <hr />

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <script type="text/javascript">  
                //GridView Comment  
                function showReply(n) {
                    $("#divReply" + n).show();
                    return false;
                }
                function closeReply(n) {
                    $("#divReply" + n).hide();
                    return false;
                }
            </script>

        </div>
    </form>
</body>
</html>
