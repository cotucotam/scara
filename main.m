function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 02-Apr-2022 10:49:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.SliderTheta1, 'SliderStep', [1 1]/25);
set(handles.SliderTheta2, 'SliderStep', [1 1]/25);
set(handles.SliderD3, 'SliderStep', [1 1]/25);
set(handles.SliderTheta4, 'SliderStep', [1 1]/25);

%% variable
global plotdata;
plotdata = null(1,3);
global Scara;
Scara=SCARA_object(0.372,0.095,0.45,0.4);
Scara.theta1=0;
Scara.theta2=0;
Scara.d3=0;
Scara.theta4=0;

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function SliderTheta1_Callback(hObject, eventdata, handles)
% hObject    handle to SliderTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Scara.theta1 = get(handles.SliderTheta1,'value');
set(handles.DisplayTheta1,'string',num2str(Scara.theta1));
Scara.theta1 = Scara.theta1/180*pi;
plot_robot(handles);

% --- Executes during object creation, after setting all properties.
function SliderTheta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function DisplayTheta1_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DisplayTheta1 as text
%        str2double(get(hObject,'String')) returns contents of DisplayTheta1 as a double


% --- Executes during object creation, after setting all properties.
function DisplayTheta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SliderTheta2_Callback(hObject, eventdata, handles)
% hObject    handle to SliderTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Scara.theta2 = get(handles.SliderTheta2,'value');
set(handles.DisplayTheta2,'string',num2str(Scara.theta2));
Scara.theta2 = Scara.theta2/180*pi;
plot_robot(handles);

% --- Executes during object creation, after setting all properties.
function SliderTheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SliderD3_Callback(hObject, eventdata, handles)
% hObject    handle to SliderD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Scara.d3 = get(handles.SliderD3,'value');
set(handles.DisplayD3,'string',num2str(Scara.d3));
plot_robot(handles);

% --- Executes during object creation, after setting all properties.
function SliderD3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SliderTheta4_Callback(hObject, eventdata, handles)
% hObject    handle to SliderTheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Scara.theta4 = get(handles.SliderTheta4,'value');
set(handles.DisplayTheta4,'string',num2str(Scara.theta4));
Scara.theta4 = Scara.theta4/180*pi;
plot_robot(handles);

% --- Executes during object creation, after setting all properties.
function SliderTheta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliderTheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function DisplayTheta2_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DisplayTheta2 as text
%        str2double(get(hObject,'String')) returns contents of DisplayTheta2 as a double


% --- Executes during object creation, after setting all properties.
function DisplayTheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DisplayD3_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DisplayD3 as text
%        str2double(get(hObject,'String')) returns contents of DisplayD3 as a double


% --- Executes during object creation, after setting all properties.
function DisplayD3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayD3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DisplayTheta4_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayTheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DisplayTheta4 as text
%        str2double(get(hObject,'String')) returns contents of DisplayTheta4 as a double


% --- Executes during object creation, after setting all properties.
function DisplayTheta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayTheta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnHome.
function BtnHome_Callback(hObject, eventdata, handles)
% hObject    handle to BtnHome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Scara=SCARA_object(0.372,0.095,0.45,0.4);
    Scara.theta1=0;
    Scara.theta2=90;
    Scara.d3=0.1;
    Scara.theta4=0;
    set(handles.DisplayTheta1,'string',num2str(Scara.theta1)); 
    set(handles.DisplayTheta2,'string',num2str(Scara.theta2));
    set(handles.DisplayTheta4,'string',num2str(Scara.theta4));
    set(handles.DisplayD3,'string',num2str(Scara.d3)); 
    set(handles.SliderTheta1,'value',Scara.theta1);
    set(handles.SliderTheta2,'value',Scara.theta2);
    set(handles.SliderTheta4,'value',Scara.theta4);
    set(handles.SliderD3,'value',Scara.d3);
    global plotdata;    
    plotdata = null(1,3);
    plot_robot(handles);



function edit_AZ_Callback(hObject, eventdata, handles)
% hObject    handle to edit_AZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_AZ as text
%        str2double(get(hObject,'String')) returns contents of edit_AZ as a double


% --- Executes during object creation, after setting all properties.
function edit_AZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_AZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ET_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ET as text
%        str2double(get(hObject,'String')) returns contents of edit_ET as a double


% --- Executes during object creation, after setting all properties.
function edit_ET_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
