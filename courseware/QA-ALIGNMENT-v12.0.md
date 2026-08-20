# Courseware QA and Alignment Report — v12.0

**Course:** Data Analytics and Visualization with R  
**Course code:** TGS-2026064475  
**QA date:** 20 August 2026  
**Result:** PASS

## Source and scope controls

- The legacy 154-slide v11 deck and supporting R materials were used as the content baseline.
- The current five-topic course structure, 16-hour duration and course identity were reconciled to the published course page.
- The current Drive assessment was used as the instrument baseline after the direct TMS assessment pull returned `401 Not authenticated`.
- Learner-facing files contain only course code `TGS-2026064475`; the legacy code remains only in source-history notes.
- No unverified generic practice-exam link was inserted because no course-matched practice exam was found in the approved source set.

## Presentation QA

- 149/149 slides rendered and visually inspected.
- 8 editable native PowerPoint charts, each with an embedded chart workbook.
- Generated cover hero is undistorted and retains the analyst subject in the right visual zone.
- Detailed click-by-click procedures are absent from the deck; lab slides contain objectives, expected outputs and acceptance checks only.
- Both trainer-profile requirements, attendance, assessment flow and course-download guidance are present.
- The visual fix cycle corrected the cover crop, scatter-chart rendering, fitted trend, axis labels and a malformed chart layout; the corrected pages were re-rendered and inspected.
- No blank slides, clipped titles, global overlaps, legacy course code or broken chart objects remain.

## Learner Guide and Lesson Plan QA

- Learner Guide: 35 pages; detailed procedures for all 10 labs.
- Lesson Plan: 8 pages; two days at exactly 480 minutes each excluding lunch.
- Static populated tables of contents render correctly in Word and PDF.
- Procedure and schedule rows are marked not to split across pages.
- Final slide-map references match the 149-slide deck.
- PPT, Learner Guide, Lesson Plan and labs share the same five-topic sequence and learning-outcome alignment.

## Lab and workbook QA

- 10/10 labs are in individual numbered folders.
- 10/10 labs include one runnable `.R` script and one `.xlsx` intake/control/evidence workbook.
- 10/10 R scripts executed successfully from their own lab folders.
- 10/10 workbooks recalculated successfully in LibreOffice with no formula errors.
- 21/21 learner-facing Markdown files have same-basename PDF copies.
- Every lab includes source data, expected outputs, troubleshooting, evidence requirements and an acceptance check.

## Assessment QA

- Instrument structure preserved: 2-question WA and 5-task PP.
- Legacy pairing preserved exactly: K1, K2; Task 1 A1; Task 2 A2/A3; Task 3 A4/A5; Task 4 A6/A7; Task 5 A8/A9.
- Four assessment DOCX files generated: WA, WA answer key, PP and PP answer key.
- Rendered assessment gate passed all four documents: cover-only page 1, candidate/instruction/grading page 2, content from page 3, LMS submission link, no official-use block and complete suggestive answers.
- Candidate papers and answer keys remain outside the public GitHub scope.

## Release verification

- Drive dry-run and production mirroring completed against the user-supplied folder `1cShyoxZRZAxRBl4UYy-c3vanFxiXA4I3`.
- Current assessment MD5 hashes match the local DOCX files exactly.
- Anonymous readback returns binary downloads for the WA and PP candidate papers; both answer keys return only an HTML access page and remain trainer-only.
- LMS-TMS readback confirmed seven live links: trainer slides, learner slides, Learner Guide, Lesson Plan, WA, PP and Activities.
- TMS semantic structure remains five topics with the same topic/subtopic titles, and all non-topic unrelated course fields were preserved.
- Platform exception: the full-update endpoint regenerates internal topic and subtopic UUIDs on every write even when titles and order are unchanged. Further TMS writes were stopped after this was verified.
