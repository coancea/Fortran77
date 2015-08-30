      subroutine solvh(res_he, xe, sym, IA, IB, NO, NS, NP)
      INTEGER*4  i, j, k, id
      REAL*8     res_he, xe, INP
      INTEGER*4 IA, IB, NO, NS, NP, SYM
      DIMENSION  res_he(32,*), xe(*)
      DIMENSION IA(1000), IB(1000)

      DO 20 i = 1, NO, 1
       DO k = 1, IA(i), 1
        id = (-1)+IB(i)+k
        CALL geteu(id, xe, sym, IA, NP)
        CALL matmult(res_he(1, id), xe, NS)
        CALL solvhe(res_he(1, id), NS, NP)
       ENDDO
 20   CONTINUE
      END

      SUBROUTINE solvhe(res_he, NS, NP)
      INTEGER*4  j, i, NS, ND, NP
      REAL*8     res_he
      DIMENSION  res_he(8, *)

C      CALL matmul(INP, xe, res_he, NS, ND, 1)

      DO j = 1, 3, 1
       DO i = 1, NP, 1
        res_he(j, i) = res_he(j, i) + i
       ENDDO
      ENDDO
      END


      SUBROUTINE geteu(k, xe, sym, IA, NP)
      INTEGER*4 i, j, k, node
      REAL*8    xe, INP
      INTEGER*4 IA, NP, SYM
      DIMENSION  xe(5,NP), IA(*)

      IF (SYM.NE.1) THEN
        DO i = 1, NP, 1
          node = IA(i) 
          DO j = 1, 5, 1
            xe(j, i) = 0.1D0*node*j
          ENDDO
        ENDDO
      ENDIF
      END

      subroutine matmult(he, xe, NS)
      INTEGER*4 id, j
      REAL*8 he(*), xe(*)
      
      DO j = 1, NS, 1
        he(j) = xe(j)
        xe(j) = 5
      ENDDO
      END
CCCCCCCCCCCCCCCCCCCCCCCCCC
CCC  PROGRAM WRAPPER   CCC
CCCCCCCCCCCCCCCCCCCCCCCCCC

      PROGRAM TESTS
C      EXTERNAL solvh
      REAL*8     res_he, INP
      DIMENSION res_he(1000), xe(1000)
      INTEGER*4 IA, IB, COND, NO, NS, ND, NP, SYM
      DIMENSION IA(1000), IB(1000), INP(1000), COND(1000)

      READ(*,*) SYM, NO, NS, NP

      CALL solvh(res_he, xe, sym, IA, IB, NO, NS, NP)

      WRITE(*,*) "RESULT: ", res_he(50)
      STOP
      END
