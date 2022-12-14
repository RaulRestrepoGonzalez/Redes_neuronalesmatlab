function varargout = Taller(varargin)
% TALLER MATLAB code for Taller.fig
%      TALLER, by itself, creates a new TALLER or raises the existing
%      singleton*.
%
%      H = TALLER returns the handle to a new TALLER or the handle to
%      the existing singleton*.
%
%      TALLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TALLER.M with the given input arguments.
%
%      TALLER('Property','Value',...) creates a new TALLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Taller_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Taller_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Taller

% Last Modified by GUIDE v2.5 05-Nov-2022 12:42:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Taller_OpeningFcn, ...
                   'gui_OutputFcn',  @Taller_OutputFcn, ...
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


% --- Executes just before Taller is made visible.
function Taller_OpeningFcn(hObject, eventdata, handles, varargin)



handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Taller_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushbutton(handles.btnImagen);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnImagen.
function btnImagen_Callback(hObject, eventdata, handles)
%se cargan las imagenen con que se va a trabajar
tipos = {'*.jpg;*.png;*.jpeg;*bmp;*.pdf'};
[file,path] = uigetfile(tipos)
if isequal(file,0)
    disp('Seleccion cancelada')
else
    imagenpath = fullfile(path,file);
    img = imread(imagenpath);
    axes(handles.axes1); 
    imshow(img);
    axis off
    hold on
end
%foto = imread("imagen.jpg")
%imshow(foto)


% --- Executes on button press in btnRed.
function btnRed_Callback(hObject, eventdata, handles)
radiobutton(handles.blanda)
radiobutton(handles.dura)



% --- Executes on button press in btnGrafica.
function btnGrafica_Callback(hObject, eventdata, handles)



% --- Executes on button press in btnRata.
function btnRata_Callback(hObject, eventdata, handles)
% hObject    handle to btnRata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function menuCompetencia_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coeficiente_Callback(hObject, eventdata, handles)
% hObject    handle to coeficiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coeficiente as text
%        str2double(get(hObject,'String')) returns contents of coeficiente as a double


% --- Executes during object creation, after setting all properties.
function coeficiente_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coeficiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function gr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate gr


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in btnDisPe.
function btnDisPe_Callback(hObject, eventdata, handles)
% hObject    handle to btnDisPe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function blanda_CreateFcn(hObject, eventdata, handles)
szX = size(X);
szW = size(W);
alpha = img;
sig = sig_i;

for i = 1:dietime
       %Busca la neurona ganadora.
       p = round(1+rand()*(szX(2)-1));
       r = zeros(1,szW(2));
       for j = 1:szW(2)
          r(j) = sqrt(sum((W(:,j)-X(:,p)).^2)); 
       end
       rid = find(r == min(r));
       %Actualiza los pesos.
       for j = 1:szW(2)
           W(:,j) = W(:,j)+alpha*exp(-((j-rid)^2)/(2*sig^2))*(X(:,p)-W(:,j));
       end
       %Varía la rata de aprendizaje.
       alpha = img*(alpha_f/img)^(i/dietime);
       sig = sig_i*(sig_f/sig_i)^(i/dietime);
       text(handles.rata);
end


% --- Executes during object creation, after setting all properties.
function dura_CreateFcn(hObject, eventdata, handles)




function nn_Callback(hObject, eventdata, handles)
% hObject    handle to nn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nn as text
%        str2double(get(hObject,'String')) returns contents of nn as a double


% --- Executes during object creation, after setting all properties.
function nn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in editn.
function editn_Callback(hObject, eventdata, handles)
% hObject    handle to editn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function gr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate gr2
