function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 23-May-2023 03:24:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.image);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in image.
function image_Callback(hObject, eventdata, handles)
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns image contents as cell array
%        contents{get(hObject,'Value')} returns selected item from image


% --- Executes during object creation, after setting all properties.
function image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in uploadimage.
function uploadimage_Callback(hObject, eventdata, handles)
% hObject    handle to uploadimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)





% --- Executes on selection change in filters.
function filters_Callback(hObject, eventdata, handles)
% hObject    handle to filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filters contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filters
val=get(hObject,'Value');
if(val==1)
 a=getappdata(0,'a');
w=Weighted(a,50);
axes(handles.axes2);
imshow(w),title('Weighted filter'); 
elseif(val==2)
  a=getappdata(0,'a');
A=Averging_filter(a,3);
axes(handles.axes2);
imshow(A),title('Averging filter'); 
elseif(val==3)
    a=getappdata(0,'a');
s=Sharping(a);
axes(handles.axes2);
imshow(s),title('Sharping filter'); 
elseif(val==4)
a=getappdata(0,'a');
edg=Edge_detiction(a);
axes(handles.axes2);
imshow(edg),title('Edge_detiction filter'); 
elseif(val==5)
a=getappdata(0,'a');
un=unSharpening(a,7);
axes(handles.axes2);
imshow(un),title('UnSharping filter'); 
elseif(val==6)
a=getappdata(0,'a');
un=max_filter(a,3);
axes(handles.axes2);
imshow(un),title('Max filter'); 
elseif(val==7)
a=getappdata(0,'a');
un=min_filter(a,3);
axes(handles.axes2);
imshow(un),title('Min filter'); 
elseif(val==8)
a=getappdata(0,'a');
un=median_filter(a,5);
axes(handles.axes2);
imshow(un),title('Median filter'); 
end


% --- Executes during object creation, after setting all properties.
function filters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Low_pass.
function Low_pass_Callback(hObject, eventdata, handles)
% hObject    handle to Low_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Low_pass contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Low_pass
val=get(hObject,'Value');
if(val==1)
a=getappdata(0,'a');
id=ideal_lowpass(a,30);
axes(handles.axes2);
imshow(id),title('Ideal'); 
elseif(val==2)
 a=getappdata(0,'a');
b=ButterWorth_lowpass(a,15,2);
axes(handles.axes2);
imshow(b),title('Butterworth_Lowpass'); 
elseif(val==3)
    a=getappdata(0,'a');
g=Gaussian_Lowpass(a,30);
axes(handles.axes2);
imshow(g),title('Gaussian_Lowpass'); 
end

% --- Executes during object creation, after setting all properties.
function Low_pass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Low_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in high_pass.
function high_pass_Callback(hObject, eventdata, handles)
% hObject    handle to high_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns high_pass contents as cell array
%        contents{get(hObject,'Value')} returns selected item from high_pass
val=get(hObject,'Value');
if(val==1)
a=getappdata(0,'a');
id=ideal_highpass(a,30);
axes(handles.axes2);
imshow(id),title('Ideal_Highpass'); 
elseif(val==2)
a=getappdata(0,'a');
b=ButterWorth_highpass(a,20,2);
axes(handles.axes2);
imshow(b),title('Butterworth_Highpass'); 
elseif(val==3)
    a=getappdata(0,'a');
g=Gaussian_highpass(a,15);
axes(handles.axes2);
imshow(g),title('Gaussian_Highpass');  
end
% --- Executes during object creation, after setting all properties.
function high_pass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in resize_image.
function resize_image_Callback(hObject, eventdata, handles)
% hObject    handle to resize_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resize_image contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resize_image
val=get(hObject,'Value');
if(val==1)
a=getappdata(0,'a');
d=DM_0L(a,9);
axes(handles.axes2);
imshow(d),title('Resize_DM_0L');  
elseif(val==2)
a=getappdata(0,'a');
b=DM_11_order(a,5);
axes(handles.axes2);
imshow(b),title('Resize_DM_1L');  
elseif(val==3)
 a=getappdata(0,'a');
im=RM_0_order(a,2,3);
axes(handles.axes2);
imshow(im),title('Resize_RM_0L');  
elseif(val==4)
a=getappdata(0,'a');
im=RM_1_order(a,2,3);
axes(handles.axes2);
imshow(im),title('Resize_RM_1L');  
end

% --- Executes during object creation, after setting all properties.
function resize_image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resize_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Image_enhancement.
function Image_enhancement_Callback(hObject, eventdata, handles)
% hObject    handle to Image_enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Image_enhancement contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Image_enhancement
val=get(hObject,'Value');
if(val==1)
 a=getappdata(0,'a');
im=Contrast(a,0,250);
axes(handles.axes2);
imshow(im),title('contrast');  
elseif(val==2)
a=getappdata(0,'a');
b=Brightness(a,50);
axes(handles.axes2);
imshow(b),title('Brightness');  
    
elseif(val==3)
a=getappdata(0,'a');
p=power_low(a,3);
axes(handles.axes2);
imshow(p),title('power_low');  
elseif(val==4)
   a=getappdata(0,'a');
p=Image_Negative(a);
axes(handles.axes2);
imshow(p),title('Negative_image');  
elseif(val==5)
a=getappdata(0,'a');
q=Quantization(a,5);
axes(handles.axes2);
imshow(q),title('Quanization');    
elseif(val==6)
a=getappdata(0,'a');
b=getappdata(0,'b');
ad=Addition(a,b);
axes(handles.axes2);
imshow(ad),title('Addition image');  
elseif(val==7)
a=getappdata(0,'a');
b=getappdata(0,'b');
su=Subtraction(a,b);
axes(handles.axes2);
imshow(su),title('Subtraction image');
elseif(val==8)
a=getappdata(0,'a');
su=Histogram_equ(a);
axes(handles.axes2);
imshow(su),title('Histogram_equalization');
elseif(val==9)
 a=getappdata(0,'a');
b=getappdata(0,'b');
su=Histogram_match(a,b);
axes(handles.axes2); 
imshow(su),title('Histogram_matching');
elseif(val==10)
a=getappdata(0,'a');
p=Histogram(a);
axes(handles.axes2);
% imhist(p);
graylevel=0:255;
  bar(graylevel,p,'BarWidth',4);
elseif(val==11)
a=getappdata(0,'a');
gr=Single_col(a);
axes(handles.axes2); 
imshow(gr),title('Single Channel Grey Image');
elseif(val==12)
a=getappdata(0,'a');
gr=Averaging(a);
axes(handles.axes2); 
imshow(gr),title('Averaging Grey Image');
elseif(val==13)
a=getappdata(0,'a');
gr=Luminance(a);
axes(handles.axes2); 
imshow(gr),title('Luminance Grey Image');
elseif(val==14)
a=getappdata(0,'a');
gr=Desaturation(a);
axes(handles.axes2); 
imshow(gr),title('Desaturation Grey Image');
elseif(val==15)
a=getappdata(0,'a');
gr=Decomposing(a);
axes(handles.axes2); 
imshow(gr),title('Decomposing Grey Image');
end

% --- Executes during object creation, after setting all properties.
function Image_enhancement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Image_enhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in uploadimage2.
function uploadimage2_Callback(hObject, eventdata, handles)
% hObject    handle to uploadimage2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=uigetfile('*.*');
b=imread(b);
axes(handles.axes2);
imshow(b);
setappdata(0,'b',b);


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9
val=get(hObject,'Value');
if(val==1)
 a=getappdata(0,'a');
im=imgnoise(a);
axes(handles.axes2);
imshow(im),title('Image Noise');  
elseif(val==2)
a=getappdata(0,'a');
b=imgnoise2(a);
axes(handles.axes2);
imshow(b),title('Image Noise');  
    
elseif(val==3)
a=getappdata(0,'a');
p=mid_point(a,3);
axes(handles.axes2);
imshow(p),title('Remove Noise');  
end


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
