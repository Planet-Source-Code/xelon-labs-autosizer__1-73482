VERSION 5.00
Begin VB.UserControl AutoSizer 
   BackStyle       =   0  'Transparent
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.CommandButton cc 
      Caption         =   "Autoresize by Ali!"
      Height          =   975
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2415
   End
   Begin VB.Timer tmrint 
      Interval        =   10
      Left            =   1800
      Top             =   960
   End
End
Attribute VB_Name = "AutoSizer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim pozz As New Collection
Dim WithEvents frm As Form
Attribute frm.VB_VarHelpID = -1

Private Sub frm_Resize()
On Error Resume Next
Dim i As Integer
Dim ln As Boolean
Dim cont As Control
Dim arr() As String
Dim nam As String

For Each cont In Parent.Controls
i = -1
i = cont.Index
If i <> -1 Then
nam = cont.Name & "(" & cont.Index & ")"
Else
nam = cont.Name
End If
i = -1
i = cont.X1

If i = -1 Then
cont.Top = Val(pozz(nam & ".top")) * Parent.ScaleHeight
cont.Left = Val(pozz(nam & ".left")) * Parent.ScaleWidth
cont.Width = Val(pozz(nam & ".width")) * Parent.ScaleWidth
cont.Height = Val(pozz(nam & ".height")) * Parent.ScaleHeight
cont.FontSize = Val(pozz(nam & ".fsz")) * Parent.ScaleHeight
Else
cont.Y1 = Val(pozz(nam & ".y1")) * Parent.ScaleHeight
cont.X1 = Val(pozz(nam & ".x1")) * Parent.ScaleWidth
cont.X2 = Val(pozz(nam & ".x2")) * Parent.ScaleWidth
cont.Y2 = Val(pozz(nam & ".y2")) * Parent.ScaleHeight
End If

Next
End Sub

Private Sub Label1_Click()

End Sub

Private Sub tmrint_Timer()
tmrint = False
GetProps
End Sub

Sub GetProps()
On Error Resume Next
Dim cont As Control
Dim nam As String
Set frm = Parent

For Each cont In Parent.Controls
i = -1
i = cont.Index
If i <> -1 Then
nam = cont.Name & "(" & cont.Index & ")"
Else
nam = cont.Name
End If
i = -1
i = cont.X1

If i = -1 Then
pozz.Add cont.Top / Parent.ScaleHeight, nam & ".top"
pozz.Add cont.Left / Parent.ScaleWidth, nam & ".left"
pozz.Add cont.Width / Parent.ScaleWidth, nam & ".width"
pozz.Add cont.Height / Parent.ScaleHeight, nam & ".height"
pozz.Add cont.FontSize / Parent.ScaleHeight, nam & ".fsz"
Else
pozz.Add cont.Y1 / Parent.ScaleHeight, nam & ".y1"
pozz.Add cont.X1 / Parent.ScaleWidth, nam & ".x1"
pozz.Add cont.X2 / Parent.ScaleWidth, nam & ".x2"
pozz.Add cont.Y2 / Parent.ScaleHeight, nam & ".y2"
End If

Next

End Sub

Private Sub UserControl_Initialize()

End Sub

Private Sub UserControl_Resize()
cc.Move 0, 0, Width, Height
End Sub
