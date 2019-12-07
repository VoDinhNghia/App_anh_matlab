function varargout = app_anh_nopthay(varargin)
% APP_ANH_NOPTHAY MATLAB code for app_anh_nopthay.fig
%      APP_ANH_NOPTHAY, by itself, creates a new APP_ANH_NOPTHAY or raises the existing
%      singleton*.
%
%      H = APP_ANH_NOPTHAY returns the handle to a new APP_ANH_NOPTHAY or the handle to
%      the existing singleton*.
%
%      APP_ANH_NOPTHAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_ANH_NOPTHAY.M with the given input arguments.
%
%      APP_ANH_NOPTHAY('Property','Value',...) creates a new APP_ANH_NOPTHAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_anh_nopthay_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_anh_nopthay_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_anh_nopthay

% Last Modified by GUIDE v2.5 18-Apr-2019 08:07:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_anh_nopthay_OpeningFcn, ...
                   'gui_OutputFcn',  @app_anh_nopthay_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before app_anh_nopthay is made visible.
function app_anh_nopthay_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_anh_nopthay (see VARARGIN)

% Choose default command line output for app_anh_nopthay
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_anh_nopthay wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_anh_nopthay_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_chonanh.
function btn_chonanh_Callback(hObject, eventdata, handles)
% hObject    handle to btn_chonanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global a;
global ima;
[filename path]=uigetfile('*.*','select image');
ima=strcat(path, filename);
a=imread(ima);
imshow(a);
set(handles.txt_thongtinanh,'string',ima);

% --- Executes on button press in btn_quayvideo.
function btn_quayvideo_Callback(hObject, eventdata, handles)
% hObject    handle to btn_quayvideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
axes(handles.axes1);
cam=videoinput('winvideo',1);
preview(cam);

% --- Executes on button press in btn_chupanh.
function btn_chupanh_Callback(hObject, eventdata, handles)
% hObject    handle to btn_chupanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global cam;
global image;
counter=1;
set(cam,'ReturnedColorSpace','RGB');
image=getsnapshot(cam);
imshow(image);
closepreview(cam);
savename=strcat('D:webcam',num2str(counter),'.jpg');
counter=counter+1;
imwrite(image,savename);

% --- Executes on button press in btn_resetanh.
function btn_resetanh_Callback(hObject, eventdata, handles)
% hObject    handle to btn_resetanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
imshow(a);

% --- Executes on selection change in popupmenu_anh.
function popupmenu_anh_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_anh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
global image;
giatri=get(handles.popupmenu_anh,'value');
if giatri==1
    anh=rgb2gray(a);
    imshow(anh);
%     anhxam=rgb2gray(image);
%     imshow(anhxam);
    counter=1;
    savename=strcat('D:anhxam',num2str(counter),'.jpg');
    imwrite(anhxam,savename);
    counter=counter+1;
end
if giatri==2
    imageRed=a(:,:,1);
    imageGreen=a(:,:,2);
    imageBlue=a(:,:,3);
    anhdo=cat(3,imageRed ,imageGreen*0 ,imageBlue*0);
    imshow(anhdo);
    counter=1;
    savename=strcat('D:anhdo',num2str(counter),'.jpg');
    imwrite(anhdo,savename);
    counter=counter+1;
end
if giatri==3
    imageRed=a(:,:,1);
    imageGreen=a(:,:,2);
    imageBlue=a(:,:,3);
    anhgreen=cat(3,imageRed*0, imageGreen, imageBlue*0);
    imshow(anhgreen);
    counter=1;
    savename=strcat('D:anhgreen',num2str(counter),'.jpg');
    imwrite(anhgreen,savename);
    counter=counter+1;
end
if giatri==4
    imageRed=a(:,:,1);
    imageGreen=a(:,:,2);
    imageBlue=a(:,:,3);
    anhblue=cat(3,imageRed*0, imageGreen*0, imageBlue);
    imshow(anhblue);
    counter=1;
    savename=strcat('D:anhblue',num2str(counter),'.jpg');
    imwrite(anhblue,savename);
    counter=counter+1;
end
if giatri==5
    anhdentrang=im2bw(a);
    imshow(anhdentrang);
end
if giatri==6
    anhcat=imcrop(a,[150 100 120 200]);
    imshow(anhcat);
end
if giatri==7
    imageRed=a(:,:,1);
    imageGreen=a(:,:,2);
    imageBlue=a(:,:,3);
    anhtim=cat(3,imageRed*1, imageGreen*0, imageBlue);
    imshow(anhtim);
    counter=1;
    savename=strcat('D:anhtim',num2str(counter),'.jpg');
    imwrite(anhtim,savename);
    counter=counter+1;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_anh contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_anh


% --- Executes during object creation, after setting all properties.
function popupmenu_anh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_anh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_histogram.
function popup_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to popup_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
giatri=get(handles.popup_histogram, 'value');
if giatri==1
    imhist(a);
end
if giatri==2
    eqhist=histeq(a);
    imshow(eqhist);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popup_histogram contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_histogram


% --- Executes during object creation, after setting all properties.
function popup_histogram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_xoayanh.
function popup_xoayanh_Callback(hObject, eventdata, handles)
% hObject    handle to popup_xoayanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
giatri=get(handles.popup_xoayanh, 'value');
if giatri==1
    xoaytrai=imrotate(a, 90, 'bilinear');
    imshow(xoaytrai);
end
if giatri==2
    xoayphai=imrotate(a, -90, 'bilinear');
    imshow(xoayphai);
end
if giatri==3
    xoay180=imrotate(a, 180, 'bilinear');
    imshow(xoay180);
end
if giatri==4
    xoay10=imrotate(a, 10, 'bilinear');
    imshow(xoay10);
end
if giatri==5
    xoay30=imrotate(a, 30, 'bilinear');
    imshow(xoay30);
    counter=1;
    savename=strcat('D:xoay30',num2str(counter),'.jpg');
    imwrite(xoay30,savename);
    counter=counter+1;
end
if giatri==6
    xoay60=imrotate(a, 60, 'bilinear');
    imshow(xoay60);
end
if giatri==7
    xoaynguoc30=imrotate(a, -30, 'bilinear');
    imshow(xoaynguoc30);
end
if giatri==8
    xoay20=imrotate(a, 20, 'bilinear');
    imshow(xoay20);
end
if giatri==9
    xoay40=imrotate(a, 40, 'bilinear');
    imshow(xoay40);
end
if giatri==10
    tform=maketform('affine', [1 0 0;.3 2 0; 0 0 1]);
    dichchuyen=imtransform(a,tform);
    imshow(dichchuyen);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popup_xoayanh contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_xoayanh


% --- Executes during object creation, after setting all properties.
function popup_xoayanh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_xoayanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_nhieuanh.
function popup_nhieuanh_Callback(hObject, eventdata, handles)
% hObject    handle to popup_nhieuanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
global counter;
giatri=get(handles.popup_nhieuanh, 'value');
if giatri==1
    anhNhieu = imnoise(a,'salt & pepper',0.02);
    imshow(anhNhieu);
    savename=strcat('D:anhnhieu', num2str(counter), '.jpg');
    imwrite(anhNhieu,savename);
    counter=counter+1;
end
if giatri==2
    anhnhieu=imnoise(a,'gaussian',0.03);
    imshow(anhnhieu);
    savename=strcat('D:anhnhieu', num2str(counter), '.jpg');
    imwrite(anhnhieu,savename);
    counter=counter+1;
end
if giatri==3
    anhxam=rgb2gray(a);
    k_v=[-1 0 1; -2 0 2; -1 0 1];
    k_h=[1 2 1; 0 0 0; -1 -2 -1];
    M1=conv2(double(anhxam), double(k_v));
    M2=conv2(double(anhxam), double(k_h));
    imshow(abs(M1), []);
    %imshow(abs(M2), []);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popup_nhieuanh contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_nhieuanh


% --- Executes during object creation, after setting all properties.
function popup_nhieuanh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_nhieuanh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_locnhieu.
function popup_locnhieu_Callback(hObject, eventdata, handles)
% hObject    handle to popup_locnhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_locnhieu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_locnhieu
axes(handles.axes2);
global a;
giatri=get(handles.popup_locnhieu, 'value');
if giatri==1
    k=ones(5)/25;
    loctrungbinh=imfilter(a,k);
    imshow(loctrungbinh);
    counter=1;
    savename=strcat('D:anhlocnhieu',num2str(counter),'.jpg');
    imwrite(loctrungbinh,savename);
    counter=counter+1;
end
if giatri==2
%     k=ones(3)/9;
%     loctrungvi=medfilt2(a,k);
    loctrungvi=medfilt2(a,[3 3]);
    imshow(loctrungvi);
end
% --- Executes during object creation, after setting all properties.
function popup_locnhieu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_locnhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
axes(handles.axes2);
global a;
global im1;
imageRed = a(:,:,1);
imageGreen = a(:,:,2);
imageBlue = a(:,:,3);
giatri=get(hObject,'Value');
set(handles.edit1,'string',num2str(giatri));
so1=double(giatri);
if (so1>=0.0)&&(so1<=1.0)
    if (so1==0.90)||(so1==0.91)||(so1==0.92)||(so1==0.93)||(so1==0.94)||(so1==0.95)||(so1==0.96)||(so1==0.97)||(so1==0.98)||(so1==0.99)||(so1==1)
        %im1=imadjust(a,[.4 .2 0; .5 .7 1],[]);
        im1=imadjust(a,[.0 .0 0; .4 .7 1],[]);
        %im1=histeq(a);
        imshow(im1);   
    
else (so1==0)||(so1==0.01)||(so1==0.02)||(so1==0.03)||(so1==0.04)||(so1==0.05)||(so1==0.06)||(so1==0.07)||(so1==0.08)||(so1==0.09)||(so1==0.1)
        im1=imadjust(a,[.4 .6 0; .6 .7 1],[]);
        imshow(im1);
  if (so1==0.11)||(so1==0.12)||(so1==0.13)||(so1==0.14)||(so1==0.15)||(so1==0.16)||(so1==0.17)||(so1==0.18)||(so1==0.19)||(so1==0.2)
        im1=imadjust(a,[.3 .6 0; .6 .7 1],[]);
        imshow(im1);
  end
        
  if (so1==0.21)||(so1==0.22)||(so1==0.23)||(so1==0.24)||(so1==0.25)||(so1==0.26)||(so1==0.27)||(so1==0.28)||(so1==0.29)||(so1==0.3)
        im1=imadjust(a,[.2 .5 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.31)||(so1==0.32)||(so1==0.33)||(so1==0.34)||(so1==0.35)||(so1==0.36)||(so1==0.37)||(so1==0.38)||(so1==0.39)||(so1==0.4)
        im1=imadjust(a,[.2 .4 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.41)||(so1==0.42)||(so1==0.43)||(so1==0.44)||(so1==0.45)||(so1==0.46)||(so1==0.47)||(so1==0.48)||(so1==0.49)||(so1==0.5)
        im1=imadjust(a,[.2 .3 0; .6 .7 1],[]);
        imshow(im1);
  end
  
  if (so1==0.5)||(so1==0.51)||(so1==0.52)||(so1==0.53)||(so1==0.54)||(so1==0.55)||(so1==0.56)||(so1==0.57)||(so1==0.58)||(so1==0.59)||(so1==0.6)
        im1=imadjust(a,[.2 .2 0; .6 .7 1],[]);
        imshow(im1);
  end 
  if (so1==0.61)||(so1==0.62)||(so1==0.63)||(so1==0.64)||(so1==0.65)||(so1==0.66)||(so1==0.67)||(so1==0.68)||(so1==0.69)||(so1==0.7)
        im1=imadjust(a,[.2 .1 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.71)||(so1==0.72)||(so1==0.73)||(so1==0.74)||(so1==0.75)||(so1==0.76)||(so1==0.77)||(so1==0.78)||(so1==0.79)||(so1==0.8)
        im1=imadjust(a,[.0 .0 0; .5 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.81)||(so1==0.82)||(so1==0.83)||(so1==0.84)||(so1==0.85)||(so1==0.86)||(so1==0.87)||(so1==0.88)||(so1==0.89)||(so1==0.9)
        %im1=imadjust(a,[.0 .0 0; .4 .7 1],[]);
        im1=histeq(a);
        imshow(im1);
  end 
end
else
    msgbox('slider nay co gia tri tu 0 den 1');
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_save.
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im1;
couter=1;
savename=strcat('D:dosang',num2str(couter),'.jpg');
imwrite(im1,savename);
couter=couter+1;
msgbox('Chuc mung ban luu anh thanh cong');

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
axes(handles.axes2);
giatrimoi = get(handles.edit1, 'string');
set(handles.slider1, 'value', str2num(giatrimoi));

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_dieuchinhsang.
function btn_dieuchinhsang_Callback(hObject, eventdata, handles)
% hObject    handle to btn_dieuchinhsang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global a;
imageRed = a(:,:,1);
imageGreen = a(:,:,2);
imageBlue = a(:,:,3);
%giatri=get(hObject,'Value');
giatrimoi = get(handles.edit1, 'string');
%set(handles.slider1,'value', str2num(giatrimoi));
so1=str2num(giatrimoi);
if (so1>=0.0)&&(so1<=1.0)
   
 if (so1==0)||(so1==0.01)||(so1==0.02)||(so1==0.03)||(so1==0.04)||(so1==0.05)||(so1==0.06)||(so1==0.07)||(so1==0.08)||(so1==0.09)||(so1==0.1)
        im1=imadjust(a,[.4 .6 0; .6 .7 1],[]);
        imshow(im1);
 end
  if (so1==0.11)||(so1==0.12)||(so1==0.13)||(so1==0.14)||(so1==0.15)||(so1==0.16)||(so1==0.17)||(so1==0.18)||(so1==0.19)||(so1==0.2)
        im1=imadjust(a,[.3 .6 0; .6 .7 1],[]);
        imshow(im1);
  end
        
  if (so1==0.21)||(so1==0.22)||(so1==0.23)||(so1==0.24)||(so1==0.25)||(so1==0.26)||(so1==0.27)||(so1==0.28)||(so1==0.29)||(so1==0.3)
        im1=imadjust(a,[.2 .5 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.31)||(so1==0.32)||(so1==0.33)||(so1==0.34)||(so1==0.35)||(so1==0.36)||(so1==0.37)||(so1==0.38)||(so1==0.39)||(so1==0.4)
        im1=imadjust(a,[.2 .4 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.41)||(so1==0.42)||(so1==0.43)||(so1==0.44)||(so1==0.45)||(so1==0.46)||(so1==0.47)||(so1==0.48)||(so1==0.49)||(so1==0.5)
        im1=imadjust(a,[.2 .3 0; .6 .7 1],[]);
        imshow(im1);
  end
  
  if (so1==0.5)||(so1==0.51)||(so1==0.52)||(so1==0.53)||(so1==0.54)||(so1==0.55)||(so1==0.56)||(so1==0.57)||(so1==0.58)||(so1==0.59)||(so1==0.6)
        im1=imadjust(a,[.2 .2 0; .6 .7 1],[]);
        imshow(im1);
  end 
  if (so1==0.61)||(so1==0.62)||(so1==0.63)||(so1==0.64)||(so1==0.65)||(so1==0.66)||(so1==0.67)||(so1==0.68)||(so1==0.69)||(so1==0.7)
        im1=imadjust(a,[.2 .1 0; .6 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.71)||(so1==0.72)||(so1==0.73)||(so1==0.74)||(so1==0.75)||(so1==0.76)||(so1==0.77)||(so1==0.78)||(so1==0.79)||(so1==0.8)
        im1=imadjust(a,[.0 .0 0; .5 .7 1],[]);
        imshow(im1);
  end
  if (so1==0.81)||(so1==0.82)||(so1==0.83)||(so1==0.84)||(so1==0.85)||(so1==0.86)||(so1==0.87)||(so1==0.88)||(so1==0.89)||(so1==0.9)
        %im1=imadjust(a,[.0 .0 0; .4 .7 1],[]);
        im1=histeq(a);
        imshow(im1);
  end 
   if (so1==0.90)||(so1==0.91)||(so1==0.92)||(so1==0.93)||(so1==0.94)||(so1==0.95)||(so1==0.96)||(so1==0.97)||(so1==0.98)||(so1==0.99)||(so1==1)
        %im1=imadjust(a,[.4 .2 0; .5 .7 1],[]);
        im1=imadjust(a,[.0 .0 0; .4 .7 1],[]);
        %im1=histeq(a);
        imshow(im1);   
    end
else
    msgbox('slider nay co gia tri tu 0 den 1');
end

% --- Executes on button press in btn_xemgio.
function btn_xemgio_Callback(hObject, eventdata, handles)
% hObject    handle to btn_xemgio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=datestr(now,'HH:MM:SS');
msgbox(s);


% --- Executes on button press in btn_demobject.
function btn_demobject_Callback(hObject, eventdata, handles)
% hObject    handle to btn_demobject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
axes(handles.axes1);
imshow(a);

a = rgb2gray(a);
axes(handles.axes1);
im=im2bw(a,graythresh(a));
% imshow(im);
im=~im;
% imshow(im);
B = bwboundaries(im);
%imshow(im);
axes(handles.axes2);
text(10,10,strcat('\color{green}Doi tuong duoc tim thay la:',num2str(length(B))));
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 0.2)
end


% --- Executes on selection change in popup_menu1.
function popup_menu1_Callback(hObject, eventdata, handles)
% hObject    handle to popup_menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
b= get(handles.popup_menu1, 'value');
if b==1
    msgbox('Moi ban lua chon chuc nang ben duoi!');
end
if b==2
    axes(handles.axes1);
     global a;
     [filename path]=uigetfile('*.*','select image');
     ima=strcat(path, filename);
     a=imread(ima);
     imshow(a);
end
if b==3
    axes(handles.axes2);
    h=fspecial('laplacian',0);
    xp=imfilter(a,h);
    imshow(xp);
end
if b==4
   axes(handles.axes2);
   am=rgb2gray(a);
   sobel=edge(am, 'Sobel');
   imshow(sobel);
end
if b==5
    axes(handles.axes2);
    k=ones(5)/25;
    imfill=imfilter(a,k);
    imshow(imfill);

end
if b==6
    axes(handles.axes2);
    h=fspecial('laplacian',0);
    xp=imfilter(a,h);
    cp=imsubtract(a,xp);
    imshow(cp);
end
if b==7
    msgbox('Xin loi, Chua thuc hien');
end
if b==8
    axes(handles.axes2);
    level= graythresh(a);
    bw=im2bw(a,level);
    imshow(bw);
end
if b==9
    axes(handles.axes2);
    level = 105;
    bwImg = a < level;
    am = imfill(bwImg, 'holes');
    imshow(am);
end
if b==10
    axes(handles.axes2);
    I=imcomplement(a);
    SE=[0 1 0; 1 1 1; 0 1 0];
    c=imdilate(I,SE);
    imshow(c);
end
if b==11
    axes(handles.axes2);
    I=imcomplement(a);
    SE=[0 1 0; 1 1 1; 0 1 0];
    e=imerode(I,SE);
    imshow(e);
end
if  b==12
    axes(handles.axes2);
    I=imcomplement(a);
    SE=[0 1 0; 1 1 1; 0 1 0];
    e=imerode(I,SE);
    d=imdilate(e, SE);
    imshow(d);
end
if b==13
    axes(handles.axes2);
    I=imcomplement(a);
    SE=[0 1 0; 1 1 1; 0 1 0];
    c=imdilate(I,SE);
    e=imerode(c,SE);
    imshow(e);
end
% Hints: contents = cellstr(get(hObject,'String')) returns popup_menu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_menu1


% --- Executes during object creation, after setting all properties.
function popup_menu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_huongdan.
function btn_huongdan_Callback(hObject, eventdata, handles)
% hObject    handle to btn_huongdan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fid=fopen('C:\Users\DINHNGHIA\Desktop\huongdan.txt', 'r');
data=fread(fid);
chardata=char(data);
fclose(fid);
msgbox(chardata);
