# SFTask-Call-Center-Call-me-

Task: call-center

Status: released deployment package

Release date: 11.07.2017

## Installation process for developer org:

#### Pre-deployment configuration:

1. Set true "enable live agent" in target org;

2. Set true "enable translation workbench" in target org;

3. Go to "src/settings/case.settings" and set defaultCaseUser element to hold your org's username as a content

*example*: `<defaultCaseUser>YOUR_ORG_USERNAME</defaultCaseUser>`

#### Post-deployment configuration:
1. Deploy src to target org.

2. Run next apex commands in developer console:

`DailyEmailStatusOfCaseScheduler.scheduleMe();`

`WeeklyEmailStatusOfCaseScheduler.scheduleMe();`

3. Update html generated for web-to-case functionality with new org Id.

enjoy your all set-up and ready to go call-center.
