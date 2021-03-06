C
C  SUBROUTINE RHPXAMB
C
      SUBROUTINE RHPXAMB(NOBS,LVL2_TIME,LVL2_IPRN,
     &                        LVL2_FLAG,LVL2_NW,  LVL2_N3)             
C
C=======================================================================
C     ****F* AMBFIX/RHPXAMB
C
C   FUNCTION   
C   
C     READ LVL2 FORMAT OBSERVATION DATA INTO MEMORY TO PROCESS LATER.
C
C   INPUTS
C
C     NONE
C
C   OUTPUT
C
C     LVL2_PNTR  INTEGER        RECORD POINTER IN LVL2. 
C     LVL2_TIME  REAL*8         TIME IN SECONDS PAST J2000.0
C     LVL2_IPRN  INTEGER        IPRN FOR SATELLITE, 
C                               IF SAT.SYSTEM = GPS,     IPRN = PRN
C                               IF SAT.SYSTEM = GALIEO,  IPRN = PRN+100
C                               IF SAT.SYSTEM = GLONASS, IPRN = PRN+200
C                               IF SAT.SYSTEM = SBAS,    IPRN = PRN+300
C   
C     LVL2_OBS                  OBSERVATIONS
C     LVL2_LLI                  LLI
C     LVL2_SNR                  SIGNAL TO NOISE 
C
C
C   COPYRIGHT
C
C     COPYRIGHT(C) 2006-        SHOUJIAN ZHANG,
C                               SCHOOL OF GEODESY AND GEOMATICS,
C                               WUHAN UNIVERSITY.
C     ***
C
C     $ID: RHPXAMB.F,V 1.0 2009/07/10 $
C=======================================================================
C
      IMPLICIT NONE
C
      INCLUDE      '../../include/rinex.h'
C
      INTEGER       NOBS
C
      INTEGER       LVL2_PNTR  (MAX_OBS_REC)
      REAL*8        LVL2_TIME  (MAX_OBS_REC)
      INTEGER       LVL2_IPRN  (MAX_OBS_REC)
C
      INTEGER       LVL2_FLAG  (MAX_OBS_REC)
      REAL*8        LVL2_NW    (MAX_OBS_REC)
      REAL*8        LVL2_N3    (MAX_OBS_REC)
C
C     LOCAL
C
      CHARACTER*200 LINE
      INTEGER       IREC, NREC
C
C     REWIND
C
      REWIND(211)
C
C     READ LVL2 OBSERVATION DATA
C     ==========================
C
      IREC = 0
C
 100  CONTINUE
C
      IREC = IREC + 1
c
      READ(211, FMT=1000, END=444) 
     &     LVL2_PNTR(IREC), 
     &     LVL2_TIME(IREC),LVL2_IPRN(IREC),
     &     LVL2_FLAG(IREC),LVL2_NW  (IREC),LVL2_N3(IREC)
C
 1000      FORMAT(I6,F18.7,(X,I3),I4,2F8.3)
C
      GOTO 100
C
 444  CONTINUE
C
      NOBS = IREC - 1
C
      RETURN
C
      END
