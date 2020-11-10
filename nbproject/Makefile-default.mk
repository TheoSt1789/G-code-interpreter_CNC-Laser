#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=cnc_test1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cnc_test1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cnc_test1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cnc_test1.o

# Source Files
SOURCEFILES=cnc_test1.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_CC="C:\Program Files (x86)\PICC\CCSCON.exe"
MP_LD="C:\Program Files (x86)\PICC\CCSCON.exe"
sourceline.device=sourceline="\#device PIC18F4550"
sourceline.xccompat=sourceline="\#device PASS_STRINGS=IN_RAM" sourceline="\#device CONST=READ_ONLY" sourceline="\#case" sourceline="\#TYPE SIGNED" sourceline="\#type INT=16, LONG=32"
sourceline.gcccompat=sourceline="\#device PASS_STRINGS=IN_RAM" sourceline="\#device CONST=READ_ONLY" sourceline="\#case" sourceline="\#TYPE SIGNED"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cnc_test1.o: cnc_test1.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
ifeq (1,1) 
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  out="${OBJECTDIR}"  cnc_test1.c +FH +DF +CC +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P #__18F4550=1 
	@mv ${OBJECTDIR}/cnc_test1.cof "dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.cof" 
	@mv ${OBJECTDIR}/cnc_test1.hex "dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.hex"
else 
	${MP_CC}  out=""${OBJECTDIR}"" cnc_test1.c +EXPORT +FH +DF +CC +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P #__18F4550=1 +EXPORTD="${OBJECTDIR}"  
	
endif 
	
else
${OBJECTDIR}/cnc_test1.o: cnc_test1.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
ifeq (1,1) 
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  out="${OBJECTDIR}"  cnc_test1.c +FH +DF +CC +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P #__18F4550=1 
	@mv ${OBJECTDIR}/cnc_test1.cof "dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.cof" 
	@mv ${OBJECTDIR}/cnc_test1.hex "dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.hex"
else 
	${MP_CC}  out=""${OBJECTDIR}"" cnc_test1.c +EXPORT +FH +DF +CC +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P #__18F4550=1 +EXPORTD="${OBJECTDIR}"  
	
endif 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
ifeq (1,1) 
	
else 
	${MP_LD}   out="dist/${CND_CONF}/${IMAGE_TYPE}"  +FH +DF +CC LINK=CNC_Test1.X.${IMAGE_TYPE}.hex=${OBJECTDIR}/cnc_test1.o +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P
	
endif 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/CNC_Test1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
ifeq (1,1) 
	
else 
	${MP_LD}   out="dist/${CND_CONF}/${IMAGE_TYPE}"  +FH +DF +CC LINK=CNC_Test1.X.${IMAGE_TYPE}.hex=${OBJECTDIR}/cnc_test1.o +Y=9 +EA I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Devices" I+="..\..\..\..\..\..\..\..\..\Program Files (x86)\PICC\Drivers" +DF +LN +T +A +M +J +Z -P
	
endif 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
