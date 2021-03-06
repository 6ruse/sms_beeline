unit uRecentNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PropFilerEh, PropStorageEh;

type
  TFrmRecentNumber = class(TForm)
    GroupBox1: TGroupBox;
    ListPhone: TListBox;
    PropStorageEh1: TPropStorageEh;
    procedure ListPhoneDblClick(Sender: TObject);
  private
    { Private declarations }
    function getItemIndexCod: byte;
    function getPhone: string;

  public
    { Public declarations }
    property itemIndexCod : byte read getItemIndexCod ;
    property phone : string read getPhone ;
    procedure addPhone(cod, phone : string ) ;
  end;

var
  FrmRecentNumber: TFrmRecentNumber;
  OldItem : string ;

implementation

uses uMain;

{$R *.dfm}

{ TFrmRecentNumber }

procedure TFrmRecentNumber.addPhone(cod, phone: string);
  var
    s : string ;
    i : integer;
    flag : Boolean ;
begin
  s    := cod+phone ;
//  flag := false;
//  for I := 0 to ListPhone.Count - 1 do
//  begin
//    if ListPhone.Items[i] = s then
//    begin
//      flag := true;
//      Break;
//    end;
//  end;
//  if not flag then
    ListPhone.Items.Add(s);
end;

function TFrmRecentNumber.getItemIndexCod: byte;
begin
  case strToInt(copy(ListPhone.Items[ListPhone.ItemIndex],1,3)) of
    705 : result := 0 ;
    771 : result := 1 ;
    777 : result := 2 ;
  end;
end;

function TFrmRecentNumber.getPhone: string;
begin
  result := copy(ListPhone.Items[ListPhone.ItemIndex],3,length(ListPhone.Items[ListPhone.ItemIndex]));
end;

procedure TFrmRecentNumber.ListPhoneDblClick(Sender: TObject);
begin
  FrmRecentNumber.ModalResult := MrOk ;
end;

end.
