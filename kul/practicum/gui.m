% UI for experimenting with convergence of different functions
%
% @author: Christophe VG

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
  hideBorderOnFormula();

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
  
  % formulas
  % TODO: use function to do this with concatenated formulaX name
  formula1 = findobj('Tag', 'formula1');
  set(formula1,'Units','pixels');
  formula1_pos = get(formula1,'Position');
  formula1_pos(2) = panelInspector_pos(4)-30;
  set(formula1, 'Position', formula1_pos);

  formula2 = findobj('Tag', 'formula2');
  set(formula2,'Units','pixels');
  formula2_pos = get(formula2,'Position');
  formula2_pos(2) = panelInspector_pos(4)-50;
  set(formula2, 'Position', formula2_pos);

  formula3 = findobj('Tag', 'formula3');
  set(formula3,'Units','pixels');
  formula3_pos = get(formula3,'Position');
  formula3_pos(2) = panelInspector_pos(4)-70;
  set(formula3, 'Position', formula3_pos);

  formula4 = findobj('Tag', 'formula4');
  set(formula4,'Units','pixels');
  formula4_pos = get(formula4,'Position');
  formula4_pos(2) = panelInspector_pos(4)-90;
  set(formula4, 'Position', formula4_pos);

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

function buttonShow_Callback(~,~, ~)
  plotFormula()

function editXMin_Callback(~, ~, ~)
  plotFormula()

function editXMax_Callback(~, ~, ~)
  plotFormula()

function editYMin_Callback(~, ~, ~)
  plotFormula()

function editYMax_Callback(~, ~, ~)
  plotFormula()

function editTol_Callback(hObject, eventdata, handles)
  plotFormula()

function editMaxIt_Callback(hObject, eventdata, handles)
  plotFormula()

function editVariableK_Callback(~, ~, ~)
  plotFormula()

function editStart_Callback(~, ~, ~)
  plotFormula()

function editFormula_Callback(~, ~, ~)
  plotFormula()

function formula1_ButtonDownFcn(hObject, ~, ~)
  selectFormula(get(hObject,'String'));
  plotFormula();

function formula2_ButtonDownFcn(hObject, ~, ~)
  selectFormula(get(hObject,'String'));
  plotFormula();

function formula3_ButtonDownFcn(hObject, ~, ~)
  selectFormula(get(hObject,'String'));
  plotFormula();

function formula4_ButtonDownFcn(hObject, ~, ~)
  selectFormula(get(hObject,'String'));
  plotFormula();
  
function selectFormula(formula)
  editFormula = findobj('Tag', 'editFormula');
  set(editFormula, 'String', formula);
  % for some idiot reason we need to re-apply to no-border styling
  hideBorderOnFormula();

function plotFormula()
  editFormula = findobj('Tag', 'editFormula');
  formula = get(editFormula, 'String');

  editVariableK = findobj('Tag', 'editVariableK');
  k = str2num(get(editVariableK, 'String'));
  
  editStart = findobj('Tag', 'editStart' );
  start = str2num(get(editStart, 'String' ));

  editTol = findobj('Tag', 'editTol' );
  tol = str2num(get(editTol, 'String' ));

  editMaxIt = findobj('Tag', 'editMaxIt' );
  maxIt = str2num(get(editMaxIt, 'String' ));
  
  axes = findobj('Tag', 'axes');
  
  editXMin = findobj('Tag', 'editXMin');
  editXMax = findobj('Tag', 'editXMax');
  editYMin = findobj('Tag', 'editYMin');
  editYMax = findobj('Tag', 'editYMax');
  xmin = str2num(get(editXMin,'String'));
  xmax = str2num(get(editXMax,'String'));
  ymin = str2num(get(editYMin,'String'));
  ymax = str2num(get(editYMax,'String'));
  % TODO: add checks to make sure that min < max
  
  axes = gca;
  cla(axes, 'reset');

  textX = findobj('Tag', 'textX');
  textY = findobj('Tag', 'textY');
  textIterations = findobj('Tag', 'textIterations');
  
  set(textX, 'String', 'working...' );
  set(textY, 'String', '' );
  set(textIterations, 'String', '' );
  
  drawnow;
  
  func = eval(strcat('@(x,k) ', formula));
  [xs, xzero] = subst(func, start, tol, maxIt, k );
  show_iteration(func, k, xs, xmin, xmax, ymin, ymax, axes);

  % update resulting x, y and #iterations
  set(textX, 'String', strcat('x = ', num2str(xzero)));
  y = feval(func, xzero, k);
  set(textY, 'String', strcat('y = ', num2str(y)));
  iterations = size(xs) -1;
  set(textIterations, 'String', strcat('#iter = ', num2str(iterations(2))));
  
function hideBorderOnFormula()
  hEditFomula = findobj('Tag', 'editFormula');
  jEdit = findjobj(hEditFomula);
  jEdit.Border = [];
