function varargout = untitled7(varargin)
% UNTITLED7 MATLAB code for untitled7.fig
%      UNTITLED7, by itself, creates a new UNTITLED7 or raises the existing
%      singleton*.
%
%      H = UNTITLED7 returns the handle to a new UNTITLED7 or the handle to
%      the existing singleton*.
%
%      UNTITLED7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED7.M with the given input arguments.
%
%      UNTITLED7('Property','Value',...) creates a new UNTITLED7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled7

% Last Modified by GUIDE v2.5 30-Jan-2020 20:26:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled7_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled7_OutputFcn, ...
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


% --- Executes just before untitled7 is made visible.
function untitled7_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled7 (see VARARGIN)

% Choose default command line output for untitled7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled7_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(~, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(~, ~, ~)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, ~, ~)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(~, ~, ~)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, ~, ~)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)

N=1; %numero de iteraciones 
a=str2double(get(handles.edit1,'String')); %accedemos al valor de xn desde la interfaz grafica
b=str2double(get(handles.edit2,'String')); %accedemos al valor de xn-1 desde la interfaz grafica
funcion=get(handles.edit3,'String'); %accedemos a la funcion desde la interfaz grafica
%f2=@(x)(funcion);
f = inline(funcion,'x'); %usamos inline en este caso para calcular la funcion y le pasamos la variable a reemplazar

if((a-b)~=1) %condicion que nos permite saber si los intervalos son correctos
    set(handles.text8,'String','intervalos incorrectos'); %envia mensaje al usuario indicando que los intervalos son incorrectos
else
while(N<10000)
    fxn=f(a)
    fxn1=f(b)
    division=f(b)-f(a) %realizaos la division aparte para no cargar el metodo
    xm=(a)-(((b-a)*(f(a)))/division) %realizamos la ejecucion del metodo con la formula de la secante
    x=round(xm,4) %aplicamos un redondeo a 4 digitos 
    err = (xm-a)/xm %calculamos la division para el error
    error = abs(err*100) %lo multiplicamos por 100 y y obtenemos el valor absoluto de ello
    DATOS(N,:) = [N a b x fxn fxn1 error] %seteamos los datos en un arreglo con los datos
    set(handles.uitable1, 'data',DATOS); %enviamos los datos a la interfaz grafica para que puedan ser visto por el usuario

    b=a %asignamos el antiguo valor de xn a la variable que representa xn-1
    a=xm %el nuevo valor (xn+1) a la variable que representa a xn
    
    if(error<1) %condicion de salida del método, en este caso es insertado desde codigo el porcentaje de tolerancia del error
        set(handles.text7,'String',x); %muestra el valor de la raiz encontrada
        break;
    end

     N=N+1; %aumenta en 1 el numero de iteraciones
end
end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, ~)
close(untitled7);
untitled1
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
