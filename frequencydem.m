function varargout = frequencydem(varargin)
% Author : Yingzi Eliza Du
% Version: 1.0
% Date   : January, 27 2004




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @frequencydem_OpeningFcn, ...
                   'gui_OutputFcn',  @frequencydem_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
               
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


%----------------------------------------------------------
% --- Executes just before frequencydem is made visible.
function frequencydem_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
movegui(hObject,'onscreen')% To display application onscreen
movegui(hObject,'center')  % To display application in the center of screen
image_file = get(handles.nameEdit,'String');
im_original=image_read(char(image_file));
set(handles.Or_image,'HandleVisibility','OFF')
set(handles.filtered_image,'HandleVisibility','OFF');
set(handles.difference_image,'HandleVisibility','OFF');
set(handles.filt3D,'HandleVisibility','OFF');
set(handles.filt2D,'HandleVisibility','OFF');
set(handles.Or_image,'HandleVisibility','ON')
axes(handles.Or_image);
 imagesc(im_original);
 colormap(gray(256));
 axis equal;
axis tight;
axis off;
set(handles.Or_image,'HandleVisibility','OFF')
set(handles.Or_image,'XTickLabel',' ','YTickLabel',' ')


%----------------------------------------------------------
% --- Outputs from this function are returned to the command line.
function varargout = frequencydem_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


%----------------------------------------------------------
% --- Executes during object creation, after setting all properties.
function image_selection_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

%----------------------------------------------------------
% Executes on button press in apply_button.
function apply_button_Callback(hObject, eventdata, handles)

image_file = get(handles.nameEdit,'String');  % to read the image filename selected
im_original=image_read(char(image_file));  % filename
% set(handles.Or_image,'HandleVisibility','ON')  % to make plot 1 visible for original image plot
% image(im_original);
% colormap(gray(256));
% axis image;
% axis off;
% set(handles.filtered_image,'HandleVisibility','OFF') % to make plot 2 unvisible to the original image plot

set(handles.Or_image,'XTickLabel',' ','YTickLabel',' ') % to get rid of tick labels
method_number = get(handles.method_selection,'Value'); % selected method
t = get(handles.cutoffEdit,'String');
F_cut = str2num (t);
if F_cut <= 0
    msgbox ('Please input meaningful cut off frequency');
    return
end;
% For gaussian blur and USM-Filter method
switch method_number
    case { 1 } %Ideal Filter
        [im_filtered, H] = ideal_low(im_original, F_cut);
     case { 2 }
        [im_filtered, H] = ideal_high(im_original, F_cut);
     case { 3 } 
        [im_filtered, H] = gaussian_low(im_original,F_cut);
     case { 4 }
        [im_filtered, H]= gaussian_high(im_original, F_cut);
     case { 5 }
         t = get(handles.butflyEdit,'String');
         n = str2num (t);
         if t <= 0
             msgbox('Invalid order number!');
             return;
         end;
         [im_filtered, H] = butterworth_low(im_original, F_cut,n);
     case { 6 }
         t = get(handles.butflyEdit,'String');
         n = str2num (t);
         if t <= 0
             msgbox('Invalid order number!');
             return;
         end;
         [im_filtered, H] = butterworth_high(im_original, F_cut,n);
 end;

set(handles.Or_image,'HandleVisibility','ON')
axes(handles.Or_image);
 imagesc(im_original);
 colormap(gray(256));
 axis equal;
axis tight;
axis off;
set(handles.Or_image,'HandleVisibility','OFF')
set(handles.filtered_image,'HandleVisibility','ON') ; % to make plot 2 visible to the filtered image plot
axes(handles.filtered_image);
imagesc(im_filtered) % to plot filtered image
 colormap(gray(256));
axis equal;
axis tight;
axis off;
set(handles.filtered_image,'HandleVisibility','OFF') 
set(handles.difference_image,'HandleVisibility','ON');
axes(handles.difference_image);
dif_image = im_filtered- im_original;
imagesc(dif_image);
colormap(gray(256));
axis equal;
axis tight;
axis off;
set(handles.difference_image,'HandleVisibility','OFF') 
set(handles.filt2D,'HandleVisibility','ON');
axes(handles.filt2D);
imagesc(H);
colormap(gray(256));
axis equal;
axis tight;
axis off;
set(handles.filt2D,'HandleVisibility','OFF');
set(handles.filt3D,'HandleVisibility','ON');
axes(handles.filt3D);
[co,ro]=size(H);

surfl(H);
 
set(handles.filt3D,'HandleVisibility','OFF');

%----------------------------------------------------------
% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
close all; % to close GUI


%----------------------------------------------------------
% --- Executes during object creation, after setting all properties.
function method_selection_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function nameEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameEdit 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

%Read all kinds of image files
function im_original=image_read(image_file)
lg=length(image_file);
if strcmpi(image_file(lg-2:lg),'mat') | strcmpi(image_file(lg-2:lg),'dat') 
    im_original=load(image_file);
else
im_original=imread(char(image_file));

end;
im_original = double(im_original);
t=size(im_original,3);
if t==3
    imt=floor((im(:,:,1)+im(:,:,2)+im(:,:,3))/3);
    clear im_original;
    im_original=imt;
    clear imt;
end;
t=size(im_original,3);
if t~=1
    display('Error in opening the image file!');
end;

% butterworth high pass filter
function [out, H] = butterworth_high (im,fc,n)
    [co,ro] = size(im);
    cx = round(co/2); % find the center of the image
    cy = round (ro/2);
    imf=fftshift(fft2(im));
    H=zeros(co,ro);
    for i = 1 : co
        for j =1 : ro
               d = (i-cx).^2 + (j-cy).^ 2;
               if d ~= 0
               H(i,j) = 1/(1+((fc*fc/d).^(2*n)));
           end;
               
        end;
    end;
    outf = imf .* H;
    out = abs(ifft2(outf));
    
% butterworth low pass filter
function [out, H] = butterworth_low (im,fc,n)
    [co,ro] = size(im);
    cx = round(co/2); % find the center of the image
    cy = round (ro/2);
    imf=fftshift(fft2(im));
    H=zeros(co,ro);
    for i = 1 : co
        for j =1 : ro
               d = (i-cx).^2 + (j-cy).^ 2;
               H(i,j) = 1/(1+((d/fc/fc).^(2*n)));
        end;
    end;
    outf = imf .* H;
    out = abs(ifft2(outf));
    
%Gaussian high pass filter
function  [out, H] = gaussian_high(im, fc)
    imf = fftshift(fft2(im));
    [co,ro]=size(im);
    H = gaussian_filter(co,ro, fc);
    H = 1-H;
    out = zeros(co,ro);
    outf= imf.*H;
    out=abs(ifft2(outf));
    
%Gaussian lowpass filter
function  [out, H] = gaussian_low(im, fc)
    imf = fftshift(fft2(im));
    [co,ro]=size(im);
    out = zeros(co,ro);
    H = gaussian_filter(co,ro, fc);
    outf= imf.*H;
    out=abs(ifft2(outf));
    
% gaussian filter
function  H = gaussian_filter(co,ro, fc)   
     cx = round(co/2); % find the center of the image
    cy = round (ro/2);
    H = zeros(co,ro);
    for i = 1 : co
        for j = 1 : ro
            d = (i-cx).^2 + (j-cy).^2;
            H(i,j) = exp(-d/2/fc/fc);
        end;
    end;
    
% Ideal High pass filter
function  [out, H] = ideal_high(im, fc)
      imf = fftshift(fft2(im));
    [co,ro]=size(im);
    H = ideal_filter(co,ro,fc);
    H = 1-H;
    outf=imf.*H;
    out=abs(ifft2(outf));

% Ideal Low pass filter
function  [out, H] = ideal_low(im, fc)
    imf = fftshift(fft2(im));
    [co,ro]=size(im);
    H = ideal_filter(co,ro,fc);
    outf=imf.*H;
    out=abs(ifft2(outf));

%Ideal filter
function H = ideal_filter(co,ro,fc)
    cx = round(co/2); % find the center of the image
    cy = round (ro/2);
    H=zeros(co,ro);
    if fc > cx & fc > cy
        H = ones(co,ro);
        return;
    end;
    for i = 1 : co
        for j = 1 : ro
            if (i-cx).^2 + (j-cy).^2 <= fc .^2
                H(i,j)=1;
            end;
        end;
    end;

% --- Executes on selection change in method_selection.
function method_selection_Callback(hObject, eventdata, handles)
% hObject    handle to method_selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns method_selection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method_selection



function nameEdit_Callback(hObject, eventdata, handles)
% hObject    handle to nameEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameEdit as text
%        str2double(get(hObject,'String')) returns contents of nameEdit as a double


% --- Executes during object creation, after setting all properties.
function butflyEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butflyEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function butflyEdit_Callback(hObject, eventdata, handles)
% hObject    handle to butflyEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of butflyEdit as text
%        str2double(get(hObject,'String')) returns contents of butflyEdit as a double


