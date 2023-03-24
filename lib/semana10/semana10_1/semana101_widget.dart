import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'semana101_model.dart';
export 'semana101_model.dart';

class Semana101Widget extends StatefulWidget {
  const Semana101Widget({Key? key}) : super(key: key);

  @override
  _Semana101WidgetState createState() => _Semana101WidgetState();
}

class _Semana101WidgetState extends State<Semana101Widget> {
  late Semana101Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Semana101Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Calendario',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowCalendar(
                color: valueOrDefault<Color>(
                  _model.colorPicked,
                  FlutterFlowTheme.of(context).primaryText,
                ),
                iconColor: valueOrDefault<Color>(
                  _model.colorPicked,
                  FlutterFlowTheme.of(context).primaryText,
                ),
                weekFormat: false,
                weekStartsMonday: false,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).alternate,
                  fontWeight: FontWeight.w500,
                  fontSize: 25.0,
                ),
                dayOfWeekStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                dateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).tertiaryColor,
                ),
                selectedDateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
                inactiveDateStyle: TextStyle(),
              ),
              Text(
                dateTimeFormat('d/M/y', _model.calendarSelectedDay!.start),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: _model.colorPicked,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  final _colorPickedColor = await showFFColorPicker(
                    context,
                    currentColor: _model.colorPicked ??=
                        FlutterFlowTheme.of(context).primaryColor,
                    showRecentColors: true,
                    allowOpacity: true,
                    textColor: FlutterFlowTheme.of(context).primaryText,
                    secondaryTextColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    primaryButtonBackgroundColor:
                        FlutterFlowTheme.of(context).primaryColor,
                    primaryButtonTextColor: Colors.white,
                    primaryButtonBorderColor: Colors.transparent,
                    displayAsBottomSheet: isMobileWidth(context),
                  );

                  if (_colorPickedColor != null) {
                    setState(() => _model.colorPicked = _colorPickedColor);
                  }
                },
                text: 'Color',
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hola',
                              style: TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Este es un resumen',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Cierrre',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RadarChart5(
                          width: double.infinity,
                          height: double.infinity,
                          firstData: 85.0,
                          secondData: 10.0,
                          thirdData: 70.0,
                          forthData: 45.0,
                          fifthData: 98.0,
                          maxPointValue: 100.0,
                          myColor: FlutterFlowTheme.of(context).secondaryColor,
                          firstDataLabel: 'Estudiantes',
                          secondDataLabel: 'Docentes',
                          thirdDataLabel: 'Administrativos',
                          forthDataLabel: 'Graduados',
                          fifthDataLabel: 'Empleadores',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
