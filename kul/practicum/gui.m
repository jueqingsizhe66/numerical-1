function varargout = gui(varargin)
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

function gui_OpeningFcn(hObject, eventdata, handles, varargin)
  handles.output = hObject;
  guidata(hObject, handles);

function varargout = gui_OutputFcn(hObject, eventdata, handles)
  varargout{1} = handles.output;
    
function figure1_ResizeFcn(fig, ~, ~)
  % set the border of the edit box to none (this seems to be the only place
  % where the object is avaiable, should not be done everytime though :-( )
  jEdit = findjobj('class', 'edit');
  jEdit.Border = [];
  
  % set unit system temporary to pixels and get its position
  % [ left, bottom, width, height ]
  % (left bottom ?! who comes up with that?)
  old_fig_units = get(fig,'Units');
  set(fig,'Units','pixels');
  fig_pos = get(fig,'Position');

  % resize panels in a sane way
  
  % panelStatus
  panelStatus = findobj('Tag', 'panelStatus');
  set(panelStatus, 'Units', 'pixels');
  panelStatus_pos = get(panelStatus, 'Position');
  panelStatus_pos = [0, 0, fig_pos(3), panelStatus_pos(4)];
  set(panelStatus, 'Position', panelStatus_pos);
  
  % panelInspector
  panelInspector = findobj('Tag','panelInspector');
  set(panelInspector,'Units','pixels');
  panelInspector_pos = get(panelInspector,'Position');
  panelInspector_pos = [0, panelStatus_pos(4), panelInspector_pos(3), fig_pos(4)-panelStatus_pos(4)];
  set(panelInspector, 'Position', panelInspector_pos);

  % panelFormula
  panelFormula = findobj('Tag','panelFormula');
  set(panelFormula,'Units','pixels');
  panelFormula_pos = get(panelFormula,'Position');
  panelFormula_pos = [panelInspector_pos(3), fig_pos(4)-panelFormula_pos(4), fig_pos(3)-panelInspector_pos(3), panelFormula_pos(4)];
  set(panelFormula, 'Position', panelFormula_pos);
  
  % axes (no boxing, who invents these idiocies?)
  % axes = findobj('Tag', 'axes');
  % set(axes,'Units','pixels');
  % axes_pos = get(axes,'Position');
  % axes_pos = [panelInspector_pos(3)+50, panelStatus_pos(4), fig_pos(3) - panelInspector_pos(3) - 50, fig_pos(4) - panelStatus_pos(4) - panelFormula_pos(4) - 50];
  % set(axes, 'Position', axes_pos);

  % restore units on figure
  set(fig,'Units',old_fig_units);

function panelFormula_ResizeFcn(panelFormula, ~, ~)
  set(panelFormula, 'Units', 'pixels');
  panelFormula_pos = get(panelFormula, 'Position');
  
  % editFormula
  editFormula = findobj('Tag', 'editFormula');
  set(editFormula, 'Units', 'pixels');
  editFormula_pos = get(editFormula, 'Position');
  editFormula_pos(3) = panelFormula_pos(3) - editFormula_pos(1) - 120;
  set(editFormula, 'Position', editFormula_pos);

  buttonShow = findobj('Tag', 'buttonShow');
  set(buttonShow, 'Units', 'pixels');
  buttonShow_pos = get(buttonShow, 'Position');
  buttonShow_pos(3) = 120;
  buttonShow_pos(1) = editFormula_pos(1) + editFormula_pos(3);
  set(buttonShow, 'Position', buttonShow_pos);

function buttonShow_Callback(buttonShow,~, ~)
  editFormula = findobj('Tag', 'editFormula');
  plotFormula(get(editFormula, 'String'));
  
function plotFormula(formula)
  axes = findobj('Tag', 'axes');
  cla(axes);
  xs = -20:0.1:20;
  ys = [];
  for x = xs
    ys(end+1) = eval(formula);
  end
  data = [xs', ys']
  plot(axes, xs, ys);
