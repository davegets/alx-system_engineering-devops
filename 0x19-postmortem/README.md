
---

### Issue Summary
On 16/02/2024, between 2:15 PM and 3:00 PM EAT (Ethiopian time, GMT+3), all requests for the homepage to our servers received a 404 Not Found response.

### Timeline (EAT, GMT+3)
- **2:10 PM**: Deployment of updates initiated.
- **2:15 PM**: Homepage 404 errors detected.
- **2:15 PM**: Front-end and back-end teams alerted to the issue.
- **2:20 PM**: Rollback of recent changes commenced.
- **2:24 PM**: Server restart process initiated.
- **2:27 PM**: Homepage is fully operational with traffic restored.
- **2:30 PM**: Investigation into the problematic update started.
- **2:50 PM**: Root cause identified and resolved.
- **2:55 PM**: Server restart with the fixed updates initiated.
- **3:00 PM**: Full traffic restored with the corrected updates.

### Root Cause and Resolution
The issue was traced back to the front-end team's changes after a rollback confirmed the cause. A test server deployment replicated the issue, indicating the problem was not environmental. Apache2 logs did not provide sufficient insight, so we utilized `strace` to monitor the Apache2 process. This revealed numerous errors upon handling requests, leading us to discover a file extension typo `.phpp` instead of `.php`.

To correct this typo, we employed the `grep` command to search through our main directory:

```sh
grep -inR ".phpp" .
```

After correcting the typo, we proceeded to redeploy the changes and restarted the server, ensuring full functionality was restored by 3:00 PM EAT.

### Corrective and Preventative Measures
Moving forward to prevent recurrence of such issues, we will:

1. **Implement an Automated Test Pipeline**: Every update push will go through a series of automated tests to catch errors before deployment.
2. **Enhance Monitoring Systems**: Deploy monitoring tools on our servers to track network traffic, requests, and responses. We will configure alerts for abnormal patterns such as excessive 404 responses.
3. **Mandatory Testing for Updates**: Establish a policy where updates must pass a series of tests before being approved for deployment.

By taking these steps, we aim to significantly reduce the likelihood of similar issues occurring in the future, thereby improving our service reliability and response time to incidents.

---
